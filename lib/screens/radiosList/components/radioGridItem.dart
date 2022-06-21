import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../model/radio.dart';
import '../../../widgets/radioDisc.dart';

class RadioGridItem extends StatefulWidget {

  final RadioModel radio;
  final Function(String id) toggleFavorite;
  final Function(String id) willPlay;
  final VoidCallback endPlay;
  const RadioGridItem(
    {
      Key? key,
      required this.radio,
      required this.toggleFavorite,
      required this.willPlay,
      required this.endPlay,
    }
  ) : super(key: key);

  @override
  State<RadioGridItem> createState() => _RadioGridItemState();
}

class _RadioGridItemState extends State<RadioGridItem> {

  final ImageProvider waveImage = const AssetImage("assets/img/radioWave.png");
  late ImageProvider radioImage;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/radioPlayer", arguments: widget.radio);
          },
          onTapDown: (_) {
            radioImage = NetworkImage(widget.radio.image);
          },
          onLongPress: () {
            setState(() => isPlaying = true);
            widget.willPlay(widget.radio.id);
          },
          onLongPressUp: () {
            setState(() => isPlaying = false);
            widget.endPlay();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutBack,
            height: getProporcionalHeight(170),
            width: isPlaying ? getProporcionalWidth(328) : getProporcionalWidth(150),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: defBorderRadius,
              color:  const Color(0xFF6BCFAB),
              border: Border.all(color: const Color(0xD924F182), width: 2),
              image: DecorationImage(
                alignment: isPlaying ? Alignment.center : Alignment.bottomRight,
                image: isPlaying ? radioImage : waveImage,
                fit: isPlaying ? BoxFit.cover : BoxFit.scaleDown,
                opacity: isPlaying ? 0.25 : 1.0,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: getProporcionalHeight(12),
                  left: getProporcionalWidth(12),
                  child: Text(
                    "${widget.radio.frequency.toStringAsFixed(1)} MHz",
                    style: TextStyle(
                      fontSize: getProporcionalHeight(12),
                    ),
                  ),
                ),
                Positioned(
                  top: getProporcionalHeight(30),
                  left: getProporcionalWidth(12),
                  child: Text(
                    widget.radio.name,
                    style: TextStyle(
                      fontSize: getProporcionalHeight(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  top: getProporcionalHeight(12),
                  right: getProporcionalWidth(12),
                  child: InkWell(
                    onTap: () => widget.toggleFavorite(widget.radio.id),
                    child: Icon(
                      widget.radio.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      size: 22,
                      color: const Color(0xFFAC438E),
                    ),
                  ),
                ),
                if(isPlaying)
                Positioned(
                  top: 0,
                  right: -37,
                  child: RadioDisc(size: 275, image: widget.radio.image),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}