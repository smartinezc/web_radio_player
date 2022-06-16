import 'package:flutter/material.dart';
import 'package:web_radio_player/constants.dart';

import '../../../size_config.dart';
import '../../../model/radio.dart';
import './radioGridItem.dart';

class RadioGrid extends StatelessWidget {
  RadioGrid({Key? key}) : super(key: key);

  final RadioModel radio = RadioModel(
    id: "AM 1330",
    frequency: 133.0,
    name: "AM 1330",
    image: "https://tuftsdaily.com/wp-content/uploads/2021/02/Screen-Shot-2021-02-02-at-3.25.15-PM.png",
    socials: [""],
    audioStream: "https://sc.dattalive.com/8746/stream",
  );

  final RadioModel radio2 = RadioModel(
    id: "AM 1330",
    frequency: 133.0,
    name: "AM 1330",
    image: "https://tuftsdaily.com/wp-content/uploads/2021/02/Screen-Shot-2021-02-02-at-3.25.15-PM.png",
    socials: [""],
    audioStream: "https://sc.dattalive.com/8746/stream",
    isFavorite: true,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: getProporcionalHeight(400),
      height: SizeConfig.screenHeight - 170,
      child: Padding(
        padding: defScreenPadding,
        child: Wrap(
          spacing: getProporcionalWidth(20),
          runSpacing: getProporcionalHeight(45),
          children: [
            RadioGridItem(
              name: radio.name,
              frequency: radio.frequency,
              isFavorite: radio.isFavorite,
              image: radio.image,
            ),
            RadioGridItem(
              name: radio2.name,
              frequency: radio2.frequency,
              isFavorite: radio2.isFavorite,
              image: radio2.image,
            ),
          ],
        ),
      ),
    );
  }
}

// if(index.isEven){
//   return RadioGridItem(
//     name: radio.name,
//     frequency: radio.frequency,
//     isFavorite: radio.isFavorite,
//   );
// } else {
//   return RadioGridItem(
//     name: radio2.name,
//     frequency: radio2.frequency,
//     isFavorite: radio2.isFavorite,
//   );
// }