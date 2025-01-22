import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_series/counter_bloc/counter_bloc.dart';

import 'package:flutter_bloc_series/view/counter_screen.dart';

void main() {
  runApp(
    //add  device preview package for checking  responsive of app on web
    // DevicePreview(
    //   enabled: true,
    //   tools: const [
    //     ...DevicePreview.defaultTools,
    //     // CustomPlugin(),
    //   ],
    //   builder: (context) =>

      const MyApp(),
   // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_)=>CounterBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter bloc',
        theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.amberAccent),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  CounterScreen(),
      ),
    );
  }
}

