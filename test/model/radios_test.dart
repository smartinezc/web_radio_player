import 'package:flutter_test/flutter_test.dart';
import 'package:web_radio_player/model/radios.dart';

void main() {
  // Object to be tested
  final Radios radios = Radios();

  group("Radios creation tests:", () {
    test("The radios list length should be 6", () {
      expect(radios.getRadios(false).length, 6);
    });
    test("The favorites radios list length should be 3", () {
      expect(radios.getRadios(true).length, 3);
    });
  });

  group("Radios toggleFavoriteByID tests:", () {

    test("[No valid ID] The favorites radios list length should be 3", () {
      radios.toggleFavoriteByID("nonValidID");
      expect(radios.getRadios(true).length, 3);
    });
    test("[Deleting Favorite] The favorites radios list length should be 2", () {
      radios.toggleFavoriteByID("LaX");
      expect(radios.getRadios(true).length, 2);
    });
    test("[Adding Favorite] The favorites radios list length should be 3", () {
      radios.toggleFavoriteByID("Depo");
      expect(radios.getRadios(true).length, 3);
    });
  });
}