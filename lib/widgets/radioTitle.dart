import 'package:flutter/material.dart';


class RadioTitle extends StatelessWidget {

  final String name;
  final double frequency;
  const RadioTitle(this.name, this.frequency, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "${frequency.toStringAsFixed(1)} MHz",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}