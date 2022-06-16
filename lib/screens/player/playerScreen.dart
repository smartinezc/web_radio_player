import 'package:flutter/material.dart';

import '../../model/radio.dart';
import '../../widgets/backgroundGradient.dart';
import './components/body.dart';


class PlayerScreen extends StatelessWidget {
  static String routeName = "/radioPlayer";
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RadioModel radio = ModalRoute.of(context)!.settings.arguments as RadioModel;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(image: radio.image),
          Body(radio),
        ],
      ),
   );
  }
}