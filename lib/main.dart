import 'package:flutter/material.dart';
import 'lib/home_screen.dart'; // Ensure this path is correct

void main() {
  runApp(BookNGoApp());
}

class BookNGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookNGo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Use the HomeScreen class
    );
  }
}