import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';


class BackgroundGradient extends StatelessWidget {

  final String? image;
  const BackgroundGradient({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        image: image != null 
        ? DecorationImage(
          opacity: 0.25,
          fit: BoxFit.cover,
          image: NetworkImage(image!),
        )
        : null,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColor,
            kSecondaryColor,
          ],
        ),
      ),
    );
  }
}