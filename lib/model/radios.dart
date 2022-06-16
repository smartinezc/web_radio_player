import 'package:flutter/material.dart';

import './radio.dart';

class Radios extends ChangeNotifier {
  final List<RadioModel> _radios = [
    RadioModel(
      id: "AM 1330",
      frequency: 133.0,
      name: "AM 1330",
      image: "https://tuftsdaily.com/wp-content/uploads/2021/02/Screen-Shot-2021-02-02-at-3.25.15-PM.png",
      socials: [""],
      audioStream: "https://sc.dattalive.com/8746/stream",
      isFavorite: false,
    ),
    RadioModel(
      id: "Red TL",
      frequency: 115.6,
      name: "Red TL",
      image: "https://images.unsplash.com/photo-1561114601-81d07393ee3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80",
      socials: [""],
      audioStream: "https://sc.dattalive.com/8746/stream",
      isFavorite: true,
    ),
    RadioModel(
      id: "Radioaktiva",
      frequency: 97.9,
      name: "Radioaktiva",
      image: "https://images.unsplash.com/photo-1593697821094-53ed19153f21?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
      socials: [""],
      audioStream: "https://sc.dattalive.com/8746/stream",
      isFavorite: true,
    ),
  ];

  // Get radio list, no direct access to _radios properties
  List<RadioModel> get radios => [... _radios];

  List<RadioModel> get favoritesRadio => _radios.where((radio) => radio.isFavorite).toList();

  void toggleFavoriteByID(String radioID) {
    _radios.firstWhere((radio) => radio.id == radioID).toggleFavorite();
    notifyListeners();
  }

}