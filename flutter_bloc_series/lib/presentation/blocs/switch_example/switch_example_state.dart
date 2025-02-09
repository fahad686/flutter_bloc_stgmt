import 'package:equatable/equatable.dart';


class SwitchExampleState extends Equatable{
  bool isSwitch;
  double sliderValue;

  SwitchExampleState({
    this.isSwitch=false,
    this.sliderValue=0.3,
  });

SwitchExampleState copyWith({bool? isSwitch,double? sliderValue}){
  return SwitchExampleState(
    isSwitch: isSwitch??this.isSwitch,
    sliderValue: sliderValue??this.sliderValue
  );
}

@override
  List<Object?> get props=>[isSwitch,sliderValue];



}


