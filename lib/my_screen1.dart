
import 'package:flutter/material.dart';

class MyScreen1 extends StatelessWidget {
  const MyScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text("My Flutter"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Hello World01"),
            Text("Hello World01"),
            Text("Hello World01"),
            Text("Hello World01"),
            Text("Hello World01"),
          ],
        ),
      ),
    );
  }
}
