import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class PageSelectorTitle extends StatelessWidget {

  final String title;
  final bool isActive;
  const PageSelectorTitle({Key? key, required this.title, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.black,
      height: getProporcionalHeight(40),
      width: getProporcionalWidth(120),
      child: Align(
        child: AnimatedDefaultTextStyle(
          duration: kAnimationDuration,
          style: TextStyle(
            color: Color(isActive ? 0xFF666666 : 0xBF666666),
            fontSize: getProporcionalHeight(isActive ? 25 : 15),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
          child: Text(title),
        ),
      ),
    );
  }
}