import 'package:flutter/material.dart';
import 'package:web_radio_player/constants.dart';

import '../../../size_config.dart';
import './radioGridItem.dart';

class RadioGrid extends StatelessWidget {
  final List radios;
  final Function(String id) toggleFavorite;
  const RadioGrid(this.radios, this.toggleFavorite, {Key? key}) : super(key: key);

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
              id: radios[n].id,
              name: radios[n].name,
              frequency: radios[n].frequency,
              image: radios[n].image,
              isFavorite: radios[n].isFavorite,
              toggleFavorite: toggleFavorite,
            );
          }),
        ),
      ),
    );
  }
}
