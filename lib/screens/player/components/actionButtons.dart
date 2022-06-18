import 'package:flutter/material.dart';

import '../../../constants.dart';

class ActionButtons extends StatelessWidget {

  final bool isFavorite;
  final VoidCallback toggleFavorite;
  const ActionButtons(this.isFavorite, this.toggleFavorite, {Key? key}) : super(key: key);

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
            onTap: toggleFavorite,
            child: Icon(
              isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: const Color(0xFFAC438E),
            ),
          ),
        ],
      ),
    );
  }
}