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
            onTap: () => Navigator.of(context).pushNamed("/radiosList"),
            child: const Icon(Icons.list),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed("/tuner"),
            child: const Icon(Icons.radio_outlined),
          ),
        ],
      ),
    );
  }
}