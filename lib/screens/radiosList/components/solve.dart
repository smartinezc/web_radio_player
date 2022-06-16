import 'package:flutter/material.dart';
import 'package:web_radio_player/constants.dart';

import '../../../size_config.dart';
import './radioGridItem.dart';

class RadioGrid extends StatelessWidget {
  final List radios;
  const RadioGrid(this.radios, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.screenHeight - 200,
      child: Padding(
        padding: defScreenPadding,
        child: Wrap(
          spacing: getProporcionalWidth(20),
          runSpacing: getProporcionalHeight(45),
          children: List.generate(radios.length, (n) {
            return RadioGridItem(
              name: radios[n].name,
              frequency: radios[n].frequency,
              isFavorite: radios[n].isFavorite,
              image: radios[n].image,
            );
          }),
        ),
      ),
    );
  }
}
