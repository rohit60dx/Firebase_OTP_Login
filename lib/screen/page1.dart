import 'dart:math';

import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var currentdice = 2;
  void change() {
    setState(() {
      currentdice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: AssetImage("asets/images/$currentdice.jpg")),
            ElevatedButton(
                onPressed: () {
                  change();
                },
                child: Text("Change"))
          ],
        ),
      ),
    );
  }
}
