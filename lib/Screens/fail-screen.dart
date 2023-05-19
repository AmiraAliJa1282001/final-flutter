
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class ResultCase3Screen extends StatelessWidget {
  final int score;
    final int total;

  ResultCase3Screen({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Quiz App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oops!',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Image.asset(
              'lib/assets/fail.png',
              width: 200.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Score: $score / $total',
              style: TextStyle(
                color: Colors.green,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Sorry, better luck next time!",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              ),
              child: Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
