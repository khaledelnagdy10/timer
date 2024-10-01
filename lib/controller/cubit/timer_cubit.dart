import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitialState());

  static const maxSecond = 60;

  int second = maxSecond;

  Timer? timer;

  bool isCounterActive = false;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      second == 0 ? false : second--;
      emit(TimerStartedState());
    });
    emit(TimerStartedState());
  }

  void pauseTimer() {
    timer?.cancel();
    emit(TimerPausedState());
  }

  void resetTimer() {
    second = maxSecond;
    emit(TimerInitialState());
  }

  void repeatTimer() {
    resetTimer();
  }

  void completedTimer() {
    timer?.cancel();
    emit(TimerCompletedState());
  }

  void timerStarted() {
    startTimer();
    emit(TimerStartedState());
  }

  void timerPaused() {
    pauseTimer();
    emit(TimerPausedState());
  }

  void timerRepeated() {
    resetTimer();
    emit(TimerRepeatedState());
  }

  void timerCompleted() {
    emit(TimerCompletedState());
  }
}
