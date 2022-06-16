import 'package:flutter/material.dart';
// import 'package:flutter_radio_player/flutter_radio_player.dart';

import '../../../size_config.dart';
import '../../../model/radio.dart';
import './actionButtons.dart';
import '../../../widgets/radioDisc.dart';
import '../../../widgets/radioTitle.dart';
import '../../../widgets/playButton.dart';
import '../../../widgets/volumeControl.dart';


class Body extends StatefulWidget {

  final RadioModel radio;
  const Body(this.radio, {Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  // late FlutterRadioPlayer radioPlayer;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    // radioPlayer = FlutterRadioPlayer();
    // Future.delayed(Duration.zero, () async {
    //   await radioPlayer.init("Web Radio Player", "Live", widget.radio.audioStream, "false");
    // });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: getProporcionalHeight(15)),
            ActionButtons(widget.radio.isFavorite),
            SizedBox(height: getProporcionalHeight(120)),
            RotationTransition(
              turns: _controller,
              child: RadioDisc(size: getProporcionalWidth(275), image: widget.radio.image),
            ),
            SizedBox(height: getProporcionalHeight(30)),
            RadioTitle(widget.radio.name, widget.radio.frequency),
            SizedBox(height: getProporcionalHeight(30)),
            PlayButton(updatePlayingState),
            SizedBox(height: getProporcionalHeight(40)),
            const VolumeControl(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updatePlayingState() {
    isPlaying = !isPlaying;
    isPlaying ? _controller.repeat() : _controller.animateTo(1.0);
    // radioPlayer.playOrPause();
  }
}