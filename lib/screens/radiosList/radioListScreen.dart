import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../../widgets/backgroundGradient.dart';
import './components/body.dart';


class RadiosListScreen extends StatelessWidget {
  static String routeName = "/radiosList";
  const RadiosListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
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