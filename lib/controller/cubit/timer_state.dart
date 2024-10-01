part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}

final class TimerInitialState extends TimerState {}

final class TimerStartedState extends TimerState {
 


}

final class TimerPausedState extends TimerState {}

final class TimerRepeatedState extends TimerState {}

final class TimerCompletedState extends TimerState {}
