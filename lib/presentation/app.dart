import 'package:colorista/presentation/home/home_factory.dart';
import 'package:flutter/material.dart';

/// Root widget of the application
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colorista',
      home: HomeFactory(),
    );
  }
}
