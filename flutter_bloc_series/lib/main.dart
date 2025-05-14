import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_series/core/utils/image_picker_util.dart';
import 'package:flutter_bloc_series/presentation/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_series/presentation/blocs/switch_example/switch_example_bloc.dart';
import 'package:flutter_bloc_series/presentation/features/image_picker/Image_picker_bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_series/presentation/features/image_picker/image_picker_screen.dart';
import 'package:flutter_bloc_series/presentation/screens/switch_example/switch_exmple_screen.dart';

void main() {
  runApp(
    //add  device preview package for checking  responsive of app on web
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
        // CustomPlugin(),
      ],
      builder: (context) =>

      const MyApp(),
   ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_)=>CounterBloc()),
        BlocProvider(create: (_)=>SwitchExampleBloc()),
        BlocProvider(create: (_)=>ImagePickerBloc(ImagePickerUtil())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter bloc',
        theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.amberAccent),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  ImagePickerScreen(),
      ),
    );
  }
}

