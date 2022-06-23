import 'package:flutter_test/flutter_test.dart';

import 'package:web_radio_player/model/radio.dart';

void main () {
  // Object to be tested
  final RadioModel newRadio = RadioModel(
    id: "newRadio",
    name: "newRadio",
    frequency: 97.9,
    audioStream: "audioStream",
    image: "imageURL",
    socials: ["social1", "social2"],
  );

  group("RadioModel creation tests:", () {
    test("The radio didn't initialize properly", () {
      expect(newRadio.id, "newRadio", reason: "The radio ID should be 'newRadio'");
      expect(newRadio.name, "newRadio", reason: "The radio Name should be 'newRadio'");
      expect(newRadio.frequency, 97.9, reason: "The radio Frequency should be 97.9");
      expect(newRadio.audioStream, "audioStream", reason: "The radio AudioStream should be 'audioStream'");
      expect(newRadio.image, "imageURL", reason: "The radio Image should be 'imageURL'");
      expect(newRadio.socials, ["social1", "social2"], reason: "The Socials ID should be '['social1', 'social2']'");
      expect(newRadio.isFavorite, false, reason: "The radio shouldn't be favorite");
    });
  });

  group("RadioModel methods tests:", (){
    
    test("The radio should be favorite", () {
      newRadio.toggleFavorite();
      expect(newRadio.isFavorite, true);
    });
  });
}