import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc/counter_bloc.dart';
import '../blocs/counter_bloc/counter_events.dart';
import '../blocs/counter_bloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("build calling");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter App"),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //implement bloc
          BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) =>
                  previous.counter != current.counter,
                 builder: (context, state) {
                return Center(
                    child: Text(
                  state.counter.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 60),
                ));
              }),
          const SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ElevatedButton(


                onPressed: (){
                  context.read<CounterBloc>().add(DecrementCounter());
                },
              style: ButtonStyle(),
                child: Icon(Icons.minimize),

            ),
            ElevatedButton(

                onPressed: (){
                  context.read<CounterBloc>().add(IncrementCounter());
                },
              style: ButtonStyle(),
                child: Icon(Icons.add),

            ),
          ],)
        ],
      )),
    );
  }
}
