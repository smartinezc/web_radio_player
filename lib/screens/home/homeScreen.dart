import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../size_config.dart';
import '../../model/radios.dart';
import '../../widgets/backgroundGradient.dart';
import './components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? imageToDisplay;

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return Scaffold(
      body: Consumer<Radios>(
        builder: (ctx, radiosProvider, constchild) {
          List radios = radiosProvider.getRadios(false);
          imageToDisplay ??= radios[1].image;
          return Stack(
            children: [
              AnimatedSwitcher(
                duration: kAnimationDuration,
                child: BackgroundGradient(image: imageToDisplay, key: ValueKey(imageToDisplay)),
              ),
              Body(
                onItemChanged: updateBackgroundImage,
                radios: radios,
              ),
            ],
          ); 
        },
      ),
   );
  }

  void updateBackgroundImage(String image) {
    setState(() {
      imageToDisplay = image;
    });
  }
}