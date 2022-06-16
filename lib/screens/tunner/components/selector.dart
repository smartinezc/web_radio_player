import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../constants.dart';

class Selector extends StatelessWidget {
  const Selector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getProporcionalHeight(100),
          width: getProporcionalWidth(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kPrimaryLightColor,
            boxShadow: const [BoxShadow(color: Color(0x80000000), offset: Offset(0, 2), blurRadius: 3)],
          ),
        ),
        SizedBox(height: getProporcionalHeight(12)),
        Container(
          height: getProporcionalWidth(15),
          width: getProporcionalWidth(15),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryLightColor,
            boxShadow: [BoxShadow(color: Color(0x80000000), offset: Offset(0, 2), blurRadius: 3)],
          ),
        ),
      ],
    );
  }
}