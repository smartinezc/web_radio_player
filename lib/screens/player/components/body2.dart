import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../constants.dart';
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

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: getProporcionalHeight(15)),
            const ActionButtons(),
            SizedBox(height: getProporcionalHeight(35)),
            RadioTitle(widget.radio.name, widget.radio.frequency),
            SizedBox(height: getProporcionalHeight(30)),
            RotationTransition(
              turns: _controller,
              child: RadioDisc(size: getProporcionalWidth(275), image: widget.radio.image),
            ),
            SizedBox(height: getProporcionalHeight(90)),
            PlayButton(updatePlayingState),
            SizedBox(height: getProporcionalHeight(60)),
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
    isPlaying ? _controller.repeat() : _controller.animateTo(1.0, duration: kAnimationDuration);
  }
}