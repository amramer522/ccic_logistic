import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class PlayView extends StatelessWidget {
  const PlayView({super.key});

  @override
  Widget build(BuildContext context) {
    print('amr build');
    return BlocProvider(
      create: (_) => PlayCubit(),
      child: Builder(
        builder: (ctx) {
          final cubit = BlocProvider.of<PlayCubit>(ctx);
          // final cubit = ctx.read<PlayCubit>();
          return Scaffold(
            body: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: cubit.minus, icon: Icon(Icons.remove)),
                  SizedBox(width: 20),
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      print('amr BlocBuilder');
                      return Text(
                        '${context.read<PlayCubit>().count}',
                        style: TextStyle(fontSize: 50),
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(onPressed: cubit.plus, icon: Icon(Icons.add)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Translation  2
// File Picker
// Git 3
// Google Maps 0
// Notifications 8
// Audio Player

// State Management 3

// Video Player 4
// API 4
// Live Template + File Template 9
// Image From Gallery or Camera  4
// Adaptive 7
// Shimmer 0
// Shared Preferences 1





