import 'dart:math';

import 'package:ccic_g1_2026_flutter/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';

import 'login/view.dart';

class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final list = [
    _Model(title: 'Move Every shipment', subtitle: 'With Confidence', img: 'on_boarding1.jpg'),
    _Model(title: 'Track in Real-Time', subtitle: 'Stay in Control', img: 'on_boarding2.jpg'),
    _Model(title: 'Track in Real-Time', subtitle: 'Stay in Control', img: 'on_boarding3.jpg'),
  ];

  int currentPage = 0;
  final controller = PageController(initialPage: 0);
//mostfa saad
  // hello mostafe how are you
  // hello again
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            controller: controller,
            onPageChanged: (value) {
              currentPage = value;
              setState(() {});
            },
            children: List.generate(
              list.length,
              (index) => Image.asset('assets/images/' + list[index].img, height: double.infinity, fit: BoxFit.fill),
            ),
          ),
          IgnorePointer(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withValues(alpha: 0), Colors.black],
                  begin: Alignment(0, -.27),
                  end: AlignmentDirectional.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  list.length,
                  (index) => Padding(
                    padding: EdgeInsetsDirectional.only(end: index == list.length - 1 ? 0 : 34),
                    child: Transform.rotate(
                      angle: index == currentPage ? pi / 4 : 0,
                      child: Container(
                        height: 9,
                        width: 9,
                        decoration: BoxDecoration(
                          color: index == currentPage ? Colors.white : Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                list[currentPage].title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              Text(
                list[currentPage].subtitle,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(blurRadius: 6),
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: Colors.white.withValues(alpha: .25),
                      blurStyle: BlurStyle.inner,
                    ),
                    BoxShadow(
                      offset: Offset(0, -3),
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: Colors.black.withValues(alpha: .25),
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  onPressed: () {
                    if (currentPage == list.length - 1) {
                      goTo(page: LoginView(),keepHistory: false);
                    } else {
                      currentPage++;
                      controller.animateToPage(currentPage, duration: Duration(milliseconds: 1000), curve: Curves.linear);
                      setState(() {});
                    }

                  },
                  elevation: 0,
                  backgroundColor: Color(0xff2563EB),
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ),
              SizedBox(height: 14),
            ],
          ),
        ],
      ),
    );
  }
}

class _Model {
  final String title, subtitle, img;

  _Model({required this.title, required this.subtitle, required this.img});
}
