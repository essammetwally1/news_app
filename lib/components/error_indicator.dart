import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Something went wrong',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
