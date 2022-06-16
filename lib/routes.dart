import 'package:flutter/material.dart';

import './screens/home/homeScreen.dart';
import './screens/radiosList/radioListScreen.dart';
import './screens/tunner/tunerScreen.dart';
import './screens/player/playerScreen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (_) => const HomeScreen(),
  RadiosListScreen.routeName: (_) => const RadiosListScreen(),
  TunerScreen.routeName: (_) => const TunerScreen(),
  PlayerScreen.routeName: (_) => PlayerScreen(),
};