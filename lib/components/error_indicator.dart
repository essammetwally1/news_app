import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String message;
  const ErrorIndicator({super.key, this.message = 'Something went wrong'});

  @override
  Widget build(BuildContext context) {
    return Text(message, style: Theme.of(context).textTheme.titleLarge);
  }
}
