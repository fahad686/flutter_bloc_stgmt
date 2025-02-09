import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';
import '../../domain/usecases/fetch_weather_usecase.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FetchWeatherUseCase fetchWeatherUseCase;

  WeatherBloc(this.fetchWeatherUseCase) : super(WeatherInitial()) {
    on<FetchWeatherByLocation>(_onFetchWeatherByLocation);
    on<FetchWeatherByCity>(_onFetchWeatherByCity);
    on<RefreshWeather>(_onRefreshWeather);
  }

  Future<void> _onFetchWeatherByLocation(
      FetchWeatherByLocation event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await fetchWeatherUseCase.fetchByLocation(
          event.latitude, event.longitude);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  Future<void> _onFetchWeatherByCity(
      FetchWeatherByCity event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await fetchWeatherUseCase.fetchByCity(event.city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  Future<void> _onRefreshWeather(
      RefreshWeather event, Emitter<WeatherState> emit) async {
    if (state is WeatherLoaded) {
      final currentWeather = state as WeatherLoaded;
      try {
        final weather = await fetchWeatherUseCase.fetchByCity(
            currentWeather.weather.city);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    }
  }
}
