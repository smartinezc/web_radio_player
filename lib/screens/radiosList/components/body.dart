import 'package:flutter/material.dart';

import '../../../size_config.dart';
import './actionButtons.dart';
import './pageSelector.dart';
// import './radioGrid.dart';
import './solve.dart';

class Body extends StatelessWidget {

  final PageController controller = PageController();
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: getProporcionalHeight(25)),
            const ActionButtons(),
            SizedBox(height: getProporcionalHeight(25)),
            const PageSelector(),
            SizedBox(height: getProporcionalHeight(35)),
            RadioGrid(),
          ],
        ),
      ),
    );
  }
}