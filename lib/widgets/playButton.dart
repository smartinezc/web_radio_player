import 'package:flutter/material.dart';

import '../size_config.dart';
import '../constants.dart';

class PlayButton extends StatefulWidget {

  final VoidCallback callback;
  const PlayButton(this.callback, {Key? key}) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isPlaying ? _controller.reverse() : _controller.forward(); 
        isPlaying = !isPlaying;
        widget.callback();
      },
      child: Container(
        height: getProporcionalWidth(96),
        width: getProporcionalWidth(96),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: kPrimaryLightColor, width: 3),
        ),
        child: Center(
          child: AnimatedIcon(
            progress: _controller,
            icon: AnimatedIcons.play_pause,
            size: getProporcionalWidth(85),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}