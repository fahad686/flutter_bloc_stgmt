import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  final int counter;
  final bool isSwitchOn;
  const CounterState({
    this.counter=20,
    this.isSwitchOn=false,
});

   CounterState copyWith({int? counter, bool? isSwitchOn}){
     return CounterState(
       counter: counter?? this.counter,
       isSwitchOn: isSwitchOn??this.isSwitchOn,
     );
   }

  @override
  // TODO: implement props
  List<Object?> get props => [counter,isSwitchOn];
}