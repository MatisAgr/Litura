import 'package:flutter/material.dart';
import 'package:litura/app.home/home_page.dart';

void main() {
  runApp(const MyApp());
}

// Raccourci stless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon app de fou',
      theme: ThemeData(
        // primaryColor: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}

