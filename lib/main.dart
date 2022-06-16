import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './theme.dart';
import './routes.dart';
import 'model/radios.dart';
import 'screens/home/homeScreen.dart';

void main() {
  runApp(const WebRadioPlayer());
}

class WebRadioPlayer extends StatelessWidget {
  const WebRadioPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Radios(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Web Radio Player',
        theme: theme(),
        home: const HomeScreen(),
        routes: routes,
      ),
    );
  }
}