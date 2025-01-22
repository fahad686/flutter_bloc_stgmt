import 'package:bloc/bloc.dart';
import 'counter_events.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
   CounterBloc():super(const CounterState()){
      on<IncrementCounter>(_increment);
      on<DecrementCounter>(_decrement);
      on<SwitchEvent>(_changeSwitchButton);
   }
   void _increment(IncrementCounter event, Emitter<CounterState> emit){
      emit(state.copyWith(counter:state.counter+1));
   }
   void _decrement(DecrementCounter event,Emitter<CounterState> emit){
      emit(state.copyWith(counter:state.counter-1));
   }

   void _changeSwitchButton(SwitchEvent event,Emitter<CounterState> emit){
      emit(state.copyWith(isSwitchOn:!state.isSwitchOn));
   }

}