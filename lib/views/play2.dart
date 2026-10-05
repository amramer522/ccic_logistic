import 'package:ccic_g1_2026_flutter/main.dart';
import 'package:flutter/material.dart';

class Play2View extends StatefulWidget {
  const Play2View({super.key});

  @override
  State<Play2View> createState() => _Play2StateView();
}

class _Play2StateView extends State<Play2View> {

  int count = prefs.getInt('counter')??1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {
              count--;
              prefs.setInt('counter', count);
              setState(() {

              });
            }, icon: Icon(Icons.remove)),
            Text("$count",style: TextStyle(fontSize: 30),),
            IconButton(onPressed: () {
              count++;
              prefs.setInt('counter', count);
              setState(() {

              });
            }, icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
