import 'package:ccic_g1_2026_flutter/views/play/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayCubit extends Cubit<PlayStates> {
  PlayCubit() : super(PlayerInitialState());

  int count = 1;

  void minus() {
    count--;
    emit(PlayerMinusState());
  }

  void plus() {
    count++;
    emit(PlayerPlusState());
  }
}
