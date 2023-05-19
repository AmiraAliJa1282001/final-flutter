

import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';



void main() {

  runApp( HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Quiz App ",
      home: HomeScreen(),
    );
  }

  
}


