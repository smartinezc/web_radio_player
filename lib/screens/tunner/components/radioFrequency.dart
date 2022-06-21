import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import '../../../size_config.dart';
import './selector.dart';
import '../../../widgets/playButton.dart';
import '../../../widgets/volumeControl.dart';

// TODO: Decrease animation opacity
// TODO: Control animation from outside ?

class RadioFrequency extends StatefulWidget {

  final String name;
  final double frequency;
  const RadioFrequency({Key? key, required this.name, required this.frequency}) : super(key: key);

  @override
  State<RadioFrequency> createState() => _RadioFrequencyState();
}

class _RadioFrequencyState extends State<RadioFrequency> {

  late RiveAnimationController _audioWaveController;

  @override
  void initState() {
    super.initState();
    _audioWaveController = SimpleAnimation("Audio Wave", autoplay: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: getProporcionalHeight(160),
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              RiveAnimation.asset(
                "assets/animation/audioWave.riv",
                controllers: [_audioWaveController],
                fit: BoxFit.cover,
              ),
              Text(
                widget.frequency.toStringAsFixed(1),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getProporcionalHeight(80),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: getProporcionalHeight(50)),
        Text(
          widget.name,
          style: TextStyle(
            fontSize: getProporcionalHeight(30),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: getProporcionalHeight(50)),
        Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset("assets/svg/tunner.svg"),
            const Positioned(
              left: 250,
              top: -15,
              child: Selector(),
            ),
          ],
        ),
        SizedBox(height: getProporcionalHeight(60)),
        PlayButton(toggleAnimation),
        SizedBox(height: getProporcionalHeight(25)),
        const VolumeControl(),
      ], 
    );
  }

  void toggleAnimation() {
    _audioWaveController.isActive ? _audioWaveController.isActive = false : _audioWaveController.isActive = true;
  }

  @override
  void dispose() {
    _audioWaveController.dispose();
    super.dispose();
  }
}