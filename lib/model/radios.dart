import 'package:flutter/material.dart';

import './radio.dart';

class Radios extends ChangeNotifier {
  final List<RadioModel> _radios = [
    RadioModel(
      id: "RockFL",
      frequency: 133.0,
      name: "Classic Rock",
      image: "https://images.unsplash.com/photo-1598214015728-bc73871186d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80",
      socials: [""],
      audioStream: "https://us4.internet-radio.com/proxy/douglassinclair?mp=/stream",
      isFavorite: false,
    ),
    RadioModel(
      id: "Radioaktiva",
      frequency: 97.9,
      name: "Radioaktiva",
      image: "https://images.unsplash.com/photo-1593697821094-53ed19153f21?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
      socials: [""],
      audioStream: "http://24073.live.streamtheworld.com/RADIO_ACTIVA.mp3",
      isFavorite: true,
    ),
    RadioModel(
      id: "GayDIO",
      frequency: 105.9,
      name: "Dance Manchester",
      image: "https://images.unsplash.com/photo-1574154894072-18ba0d48321b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      socials: [""],
      audioStream: "https://listen-gaydio.sharp-stream.com/gaydionwhq.mp3",
      isFavorite: true,
    ),
    RadioModel(
      id: "Jazz",
      frequency: 115.6,
      name: "Smooth Jazz",
      image: "https://images.unsplash.com/photo-1599677081334-abd8d806aeb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      socials: [""],
      audioStream: "https://kunv.oit.unlv.edu/stream",
      isFavorite: false,
    ),
    RadioModel(
      id: "Depo",
      frequency: 105.9,
      name: "Deportiva 105",
      image: "https://images.unsplash.com/photo-1631659718597-1b62ad76da3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      socials: [""],
      audioStream: "https://sc.dattalive.com/8746/stream",
      isFavorite: false,
    ),
    RadioModel(
      id: "LaX",
      frequency: 103.9,
      name: "Crossover",
      image: "https://images.unsplash.com/photo-1545127398-14699f92334b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGhlYWRzZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      socials: [""],
      audioStream: "https://s5.radio.co/s980fc5249/listen",
      isFavorite: true,
    ),
  ];

  // Get radio list, no direct access to _radios properties
  List<RadioModel> getRadios(bool favorites) {
    return favorites ? _radios.where((radio) => radio.isFavorite).toList() : [... _radios];
  }

  void toggleFavoriteByID(String radioID) {
    _radios.firstWhere((radio) => radio.id == radioID).toggleFavorite();
    notifyListeners();
  }

}