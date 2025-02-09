import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_series/presentation/blocs/switch_example/switch_example_event.dart';
import 'package:flutter_bloc_series/presentation/blocs/switch_example/switch_example_state.dart';


class SwitchExampleBloc extends Bloc<SwitchExampleEvent, SwitchExampleState> {
  SwitchExampleBloc() : super(SwitchExampleState()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_sliderChangeValue);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event,Emitter<SwitchExampleState> emitter){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderChangeValue(SliderEvent event, Emitter<SwitchExampleState>emit){
    emit(state.copyWith(sliderValue: event.slider));
  }

}
