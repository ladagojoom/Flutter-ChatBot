import 'package:chat_app/onboarding.dart';
import 'package:flutter/material.dart';
// 👈 Import your MyHomePage file
import 'package:chat_app/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter chat gpt',
      theme: lightmode,    
      darkTheme: darktmode,
      home: const OnboardingScreen(), // 👈 This will show your MyHomePage
    );
  }
}
