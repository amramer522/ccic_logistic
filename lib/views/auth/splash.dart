import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:ccic_g1_2026_flutter/views/auth/on_boarding.dart';
import 'package:flutter/material.dart';

import '../../core/logic/helper_methods.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLogoWhite = false;
  bool isRect = false;

  @override
  void initState() {
    super.initState();
    goTo(page: OnBoardingView(),keepHistory: false,seconds: 3);
  }

  @override
  Widget build(BuildContext context) {
    print('amr build');

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 800),
            builder: (context, value, child) => ElasticInDown(
              from: 500,
              duration: Duration(milliseconds: 1000),
              controller: (p0) {
                print('amr ${p0.isAnimating}');
              },
              onFinish: (direction) async {
                isLogoWhite = true;
                setState(() {});
                await Future.delayed(Duration(seconds: 1));
                isRect = true;
                setState(() {});
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 3000),
                curve: Curves.linear,
                child: Container(
                  height: 270000,
                  width: 270000,
                  decoration: BoxDecoration(
                    shape: isRect ? BoxShape.rectangle : BoxShape.circle,
                    color: Color(0xff203A77),
                  ),
                  // radius: value*135*100,
                  // backgroundColor: Color(0xff203A77),
                ),
              ),
            ),
          ),

          Image.asset(
            'assets/images/splash_logo.png',
            height: 97,
            width: 200,
            fit: BoxFit.scaleDown,
            color: isLogoWhite ? Colors.white : null,
          ),
        ],
      ),
    );
  }
}
