import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Center(
            child: Text('Dicee Demo'),
          ),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 3;

  void changeDiceFace() {
    setState(
      () {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
        print('Random number is $leftDiceNumber.');
        print('Random number is $rightDiceNumber.');
      },
    );
  }

  void changeDiceFace2() {
    setState(
      () {
        var rng = Random();
        rightDiceNumber = (rng.nextInt(6)) + 1;
        leftDiceNumber = (rng.nextInt(6)) + 1;
        print('Random number is $rightDiceNumber.');
        print('Random number is $leftDiceNumber.');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset(
                  'images/dice$leftDiceNumber.png',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  changeDiceFace2();
                },
                child: Image.asset(
                  'images/dice$rightDiceNumber.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
