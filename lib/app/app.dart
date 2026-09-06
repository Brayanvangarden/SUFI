import 'package:flutter/material.dart';

class SufiApp extends StatelessWidget {
  const SufiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sufi',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text('Sufi'),
        ),
      ),
    );
  }
}