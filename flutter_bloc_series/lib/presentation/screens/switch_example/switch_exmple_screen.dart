import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_series/presentation/blocs/switch_example/switch_example_bloc.dart';
import 'package:flutter_bloc_series/presentation/blocs/switch_example/switch_example_event.dart';
import 'package:flutter_bloc_series/presentation/blocs/switch_example/switch_example_state.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch Example'),),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text("Notification"),
                BlocBuilder<SwitchExampleBloc,SwitchExampleState>(builder: (context,state){
                  return  Switch(value: state.isSwitch, onChanged: (value){
                    context.read<SwitchExampleBloc>().add(EnableOrDisableNotification());
                  });

                })
                
              ],
            ),
            SizedBox(height: 40),
          BlocBuilder<SwitchExampleBloc,SwitchExampleState>(builder: (context,state){
            return   Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(state.sliderValue),
                  shape: BoxShape.circle
              ),
            );
          }),

            const SizedBox(height: 30),

            BlocBuilder<SwitchExampleBloc,SwitchExampleState>(builder: (context,state){
              return Slider(value: state.sliderValue, onChanged: (value){
                context.read<SwitchExampleBloc>().add(SliderEvent(slider: value));



              });
            })




          ],
        ),
      ),
    );
  }
}
