import 'package:flutter_radio_player/flutter_radio_player.dart';

class AudioPlayer {

  static AudioPlayer? _instance;
  final FlutterRadioPlayer _player = FlutterRadioPlayer();

  AudioPlayer._init() {
    _player.init("Web Radio Player", "Live Radio", "", "false");
  }

  static AudioPlayer get instance => _instance ??= AudioPlayer._init();

  Future<void> changeURL(String url, bool playNow) async {
    return _player.pause()
      .then((state) {
        return _player.setUrl(url, "$playNow");
      });
  }

  void togglePlay() {
    _player.playOrPause();
  }
}