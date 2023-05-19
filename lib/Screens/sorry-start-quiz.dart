
import 'package:flutter/material.dart';
import 'HomeScreen.dart';


class SorryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sorry!',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You must add at least 5 questions to start',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "lib/assets/faq.png",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
