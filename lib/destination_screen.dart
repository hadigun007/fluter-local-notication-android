import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
  String payload;
  DestinationScreen({required this.payload});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Text(
            payload,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
