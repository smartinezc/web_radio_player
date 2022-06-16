import 'package:flutter/material.dart';

import '../../../constants.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defScreenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.favorite, color: Color(0xFFAC438E)),
          ),
        ],
      ),
    );
  }
}