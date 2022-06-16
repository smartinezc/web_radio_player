import 'package:flutter/material.dart';
import 'package:web_radio_player/screens/tunner/components/actionButtons.dart';

import '../../../size_config.dart';
import './radioFrequency.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProporcionalHeight(34)),
          const ActionButtons(),
          SizedBox(height: getProporcionalHeight(80)),
          const RadioFrequency(name: "AM 1130", frequency: 113.5),
        ],
      ),
    );
  }
}