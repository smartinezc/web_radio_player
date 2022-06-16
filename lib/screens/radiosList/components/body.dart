import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/radios.dart';
import '../../../size_config.dart';
import './actionButtons.dart';
import './pageSelector.dart';
// import './radioGrid.dart';
import './solve.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  bool onFavorites = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Consumer<Radios>(
          builder: (ctx, radiosProvider, constchild) {
            List radios = onFavorites ? radiosProvider.favoritesRadio : radiosProvider.radios;
            return Column(
              children: [
                SizedBox(height: getProporcionalHeight(25)),
                const ActionButtons(),
                SizedBox(height: getProporcionalHeight(25)),
                PageSelector(toggleFavorites),
                SizedBox(height: getProporcionalHeight(35)),
                RadioGrid(radios),
              ],
            ); 
          },
        ),
      ),
    );
  }

  void toggleFavorites(bool state) {
    if(state != onFavorites){
      setState(() => onFavorites = state);
    }
  }

}