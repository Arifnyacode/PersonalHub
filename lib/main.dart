import 'package:flutter/material.dart';
import 'welcome.dart';

void main(List<String> args) {
  runApp(const MyNavbarApp());
}

class MyNavbarApp extends StatelessWidget {
  const MyNavbarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(), // Set the WelcomeScreen as the home screen
    );
  }
}
