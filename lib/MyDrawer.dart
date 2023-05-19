

import 'package:flutter/material.dart';
import 'Screens/create-quiz-screen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/Start-quiz-screen.dart';
import 'package:flutter/services.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.pink[600],
                  radius: 30,
                  child: Text(
                    'A',
                    style: TextStyle(fontSize: 30),
                    selectionColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Amira ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'amira@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('Create Quiz'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateQuizScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.quiz),
            title: Text('Start Quiz'),
            onTap: () {
              // TODO: navigate to start quiz screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartingQuiz()),
              );
            },
          ),
          Divider( // Add a gray line here
            color: Colors.grey[300], // Customize the color if needed
            thickness: 1, // Adjust the thickness if needed
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () {
                SystemNavigator.pop(); // Exit the app
            },
          ),
        ],
      ),
    );
  }
}
