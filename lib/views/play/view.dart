import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class PlayView extends StatefulWidget {
  const PlayView({super.key});

  @override
  State<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  String showTime(int? totalSeconds) {
    totalSeconds = totalSeconds ?? 0;
    int hours = totalSeconds ~/ 3600;
    print('hours : $hours');
    int minutes = (totalSeconds % 3600) ~/ 60;
    print('minutes : $minutes');
    int seconds = totalSeconds % 60;
    print('seconds : $seconds');

    String h = hours.toString().padLeft(2, '0');
    String m = minutes.toString().padLeft(2, '0');
    String s = seconds.toString().padLeft(2, '0');
    return "${h == "00" ? "" : "$h:"}$m:${s == '00' ? "" : "$s"}";
  }

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
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                if (player.state == PlayerState.playing) {
                  await player.pause();
                } else {
                  await player.play(
                    UrlSource('https://cdn.mp3quran.net/audio/husayni-azazi/r1/058.mp3'),
                  );
                }
                setState(() {});
              },
              child: Icon(
                player.state == PlayerState.playing ? Icons.pause : Icons.play_arrow,
              ),
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FutureBuilder(
                    future: player.getDuration(),
                    builder: (context, snapFuture) => StreamBuilder(
                      stream: player.onPositionChanged,
                      initialData: Duration(seconds: 0),
                      builder: (context, snapStream) => Column(
                        children: [
                          Slider(
                            value: snapStream.data!.inSeconds.toDouble(),
                            min: 0,
                            max: snapFuture.data?.inSeconds.toDouble() ?? 1,
                            onChanged: (value) {
                              player.seek(Duration(seconds: value.toInt()));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Text(
                                  showTime(snapStream.data?.inSeconds),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Spacer(),
                                Builder(
                                  builder: (context) {
                                    int total = snapFuture.data?.inSeconds ?? 0;
                                    int finished = snapStream.data?.inSeconds ?? 0;
                                    return Text(
                                      showTime(total - finished),
                                      style: TextStyle(fontSize: 20),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final file = await FilePicker.pickFile(
                        type: FileType.custom,
                        allowedExtensions: ['mp4'],
                      );
                      print('amr ${file?.path}');
                    },
                    icon: Icon(Icons.upload),
                  ),
                  Row(
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Notifications 8




// Audio Player
// File Picker
// Google Maps 0
// Translation  2
// Git 3
// State Management 3
// Video Player 4
// API 4
// Live Template + File Template 9
// Image From Gallery or Camera  4
// Adaptive 7
// Shimmer 0
// Shared Preferences 1
