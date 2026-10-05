import 'package:flutter/material.dart';

class CreateNewPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = [1, 2, 3, 3];

    return Scaffold(
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: [
            Text("Hello"),
            Icon(Icons.person_search_rounded),
            Text("Amr"),
            Icon(Icons.person_search_rounded),
            Text("data"),
            Container(height: 100, width: 100, color: Colors.red),
            SizedBox(width: 10),
            FilledButton(onPressed: () {}, child: Text("Hello")),
            OutlinedButton(onPressed: () {}, child: Text("Hello")),
            ElevatedButton(onPressed: () {}, child: Text("Hello")),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.clear))
          ],
        ),
      ),
    );
  }
}

// Alignment المحاذاه
