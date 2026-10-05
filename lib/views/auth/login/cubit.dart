import 'package:ccic_g1_2026_flutter/views/auth/login/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../main.dart';
import '../../home/view.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordHidden = true;
//hello amr
  void togglePassword() {
    isPasswordHidden = !isPasswordHidden;
    emit(LoginTogglePasswordState());
  }

  void updateForm() {
    emit(LoginUpdateFormState());
  }

  void login() async {
    emit(LoginLoadingState());
    final resp = await DioHelper.sendData(
      'api/Account/login',
      data: {"email": emailController.text, "password": passwordController.text},
    );

    if (resp.isSuccess) {
      emit(LoginSuccessState());
      prefs.setBool('isLogin', true);
      goTo(page: HomeView(), keepHistory: false);
    } else {
      emit(LoginFailedState());
    }
  }
}
