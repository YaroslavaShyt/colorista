import 'package:flutter/material.dart';

/// Widget to display "Hello there" text
class HelloThereWidget extends StatelessWidget {
  /// Constructor
  const HelloThereWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Hello there",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
