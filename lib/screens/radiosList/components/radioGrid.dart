import 'package:flutter/material.dart';
import 'package:web_radio_player/constants.dart';

import '../../../size_config.dart';

class RadioGrid extends StatelessWidget {
  const RadioGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: getProporcionalHeight(400),
      height: SizeConfig.screenHeight - 130,
      child: Padding(
        padding: defScreenPadding,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 15/17,
            mainAxisSpacing: 15,
            crossAxisSpacing: 20,
          ),
          itemCount: 8,
          itemBuilder: (ctx, index) {
            return const Text("ctx,");
          },
        ),
      ),
    );
  }
}