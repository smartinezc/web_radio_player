import 'package:flutter/material.dart';

import '../../widgets/backgroundGradient.dart';
import './components/body.dart';


class RadiosListScreen extends StatelessWidget {
  static String routeName = "/radiosList";
  const RadiosListScreen({Key? key}) : super(key: key);

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