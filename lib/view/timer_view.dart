import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/controller/cubit/timer_cubit.dart';
import 'package:timer/widgets/cutom_floating_acctio_button.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TimerCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          final timerCubit = BlocProvider.of<TimerCubit>(context);
          int displayTime = timerCubit.second;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 20),
              Text(
                '$displayTime',
                style: const TextStyle(fontSize: 80),
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is TimerInitialState || state is TimerPausedState)
                    CustomFloatingActionButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () => timerCubit.timerStarted(),
                    ),
                  if (state is TimerStartedState)
                    CustomFloatingActionButton(
                      icon: const Icon(Icons.pause),
                      onPressed: () => timerCubit.timerPaused(),
                    ),
                  const SizedBox(width: 40),
                  CustomFloatingActionButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      timerCubit.timerRepeated();
                      timerCubit.pauseTimer();
                    },
                  ),
                ],
              ),
              const SizedBox(width: 20),
              const Spacer(flex: 20),
            ],
          );
        },
      ),
    );
  }
}
