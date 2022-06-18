import 'package:flutter/material.dart';

import '../../widgets/backgroundGradient.dart';
import './components/body.dart';


class TunerScreen extends StatelessWidget {
  static String routeName = "/tuner";
  const TunerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundGradient(),
          Body(),
        ],
       ),
    );
  }
}