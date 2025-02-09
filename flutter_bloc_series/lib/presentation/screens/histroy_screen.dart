// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../blocs/weather_bloc.dart';
// import '../blocs/weather_event.dart';
// import '../blocs/weather_state.dart';
//
// class HistoryScreen extends StatelessWidget {
//   const HistoryScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Search History"),
//       ),
//       body: BlocBuilder<WeatherBloc, WeatherState>(
//         builder: (context, state) {
//           final weatherBloc = BlocProvider.of<WeatherBloc>(context);
//
//           if (weatherBloc.searchHistory.isEmpty) {
//             return const Center(
//               child: Text("No search history yet."),
//             );
//           }
//
//           return ListView.builder(
//             itemCount: weatherBloc.searchHistory.length,
//             itemBuilder: (context, index) {
//               final city = weatherBloc.searchHistory[index];
//               return ListTile(
//                 title: Text(city),
//                 onTap: () {
//                   // Fetch weather for the selected city
//                   weatherBloc.add(FetchWeatherByCity(city));
//                   Navigator.pop(context); // Return to Home Screen
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
