import 'package:flutter/material.dart';
import 'screens/event_screen.dart'; // Updated import path

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BookNGO Home',
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.lightGreen,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to BookNGo!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the EventScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventScreen(), // Use the EventScreen class
                  ),
                );
              },
              child: Text("Let's Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}