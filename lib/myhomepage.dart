import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int dice1, dice2;
  @override
  void initState() {
    dice1 = 1;
    dice2 = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dice 1 Roll : " + '$dice1'),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image(
                          image: AssetImage("assets/images/$dice1.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dice 2 Roll : " + '$dice2'),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image(
                          image: AssetImage("assets/images/$dice2.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (() => {
                    setState(() {
                      Random random = Random();
                      Random random2 = Random();
                      dice1 = random.nextInt(6) + 1;
                      dice2 = random2.nextInt(6) + 1;
                      if (dice1 == dice2) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('You win'),
                            content: const Text('Both dice are equal'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                  }),
              child: Text("Roll"),
            )
          ],
        ),
      ),
    );
  }
}
