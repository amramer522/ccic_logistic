import 'package:ccic_g1_2026_flutter/core/logic/dio_helper.dart';
import 'package:ccic_g1_2026_flutter/core/logic/helper_methods.dart';
import 'package:ccic_g1_2026_flutter/views/auth/login/cubit.dart';
import 'package:ccic_g1_2026_flutter/views/auth/login/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../main.dart';
import '../../home/view.dart';
// hello
class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    print('amr build');
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (ctx) {
          final cubit = BlocProvider.of<LoginCubit>(ctx);

          return Scaffold(
            body: Image.asset(
              "assets/images/login_bg.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            bottomSheet: BottomSheet(
              onClosing: () {},
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder(
                  bloc: cubit,
                  buildWhen: (previous, current) => current is LoginUpdateFormState,
                  builder: (context, state) => Form(
                    onChanged: cubit.updateForm,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 57),
                        Image.asset('assets/images/logo.png', height: 54, width: 162),
                        SizedBox(height: 24),
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1C3877),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Enter your email and password to log in ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6C7278),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: cubit.emailController,
                          decoration: InputDecoration(
                            labelText: "EMAIL ID",
                            hintText: 'Enter your email',
                            prefixIcon: SvgPicture.asset(
                              "assets/icons/email_id.svg",
                              height: 20,
                              width: 20,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        BlocBuilder(
                            bloc: cubit,
                            buildWhen: (previous, current) =>
                            current is LoginTogglePasswordState,
                            builder: (context,state) {
                            return TextFormField(
                              controller: cubit.passwordController,
                              obscureText: cubit.isPasswordHidden,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                labelText: "PASSWORD",
                                hintText: 'Enter your password',
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 24,
                                      child: VerticalDivider(
                                        color: Color(0xffD9D9D9),
                                        thickness: 1,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: cubit.togglePassword,
                                      icon: SvgPicture.asset(
                                        "assets/icons/password_${cubit.isPasswordHidden ? "off" : 'on'}.svg",
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ],
                                ),
                                prefixIcon: SvgPicture.asset(
                                  "assets/icons/password.svg",
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          }
                        ),
                        SizedBox(height: 24),
                        BlocBuilder(
                          bloc: cubit,
                          buildWhen: (previous, current) =>
                              current is! LoginTogglePasswordState,
                          builder: (context, state) {
                            print('amr login button');
                            return FilledButton.icon(
                              icon: state is LoginLoadingState
                                  ? SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(),
                                    )
                                  : null,
                              onPressed:
                                  cubit.emailController.text.isEmpty ||
                                      cubit.passwordController.text.isEmpty ||
                                      state is LoginLoadingState
                                  ? null
                                  : cubit.login,
                              label: Text("Login"),
                            );
                          },
                        ),
                        SizedBox(height: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
