import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
        child: Column(
          children: [
            Text('Congratulations!!!!!',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            )),
            Text('Welcome to the Application',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                )),
            Text('You are a Verified User',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ))

          ],
        ),
      )
    );
  }
}