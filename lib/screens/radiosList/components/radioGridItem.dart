import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../widgets/radioDisc.dart';

class RadioGridItem extends StatefulWidget {

  final String id;
  final String name;
  final double frequency;
  final String image;
  final bool isFavorite;
  final Function(String id) toggleFavorite;
  const RadioGridItem(
    {
      Key? key,
      required this.id,
      required this.name,
      required this.frequency,
      required this.image,
      required this.isFavorite,
      required this.toggleFavorite,
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
          onTapDown: (_) {
            radioImage = NetworkImage(widget.image);
          },
          onLongPress: () {
            setState(() => isPlaying = true);
          },
          onLongPressUp: () {
            setState(() => isPlaying = false);
          },
          child: AnimatedContainer(
            duration: kAnimationDuration,
            curve: Curves.fastOutSlowIn,
            height: getProporcionalHeight(170),
            width: isPlaying ? getProporcionalWidth(328) : getProporcionalWidth(150),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: defBorderRadius,
              color:  const Color(0x4DD2D2D2),
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
                    "${widget.frequency.toStringAsFixed(1)} MHz",
                    style: TextStyle(
                      fontSize: getProporcionalHeight(12),
                    ),
                  ),
                ),
                Positioned(
                  top: getProporcionalHeight(30),
                  left: getProporcionalWidth(12),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: getProporcionalHeight(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  top: getProporcionalHeight(12),
                  right: getProporcionalWidth(12),
                  child: InkWell(
                    onTap: () => widget.toggleFavorite(widget.id),
                    child: Icon(
                      widget.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      size: 22,
                      color: const Color(0xFFAC438E),
                    ),
                  ),
                ),
                if(isPlaying)
                Positioned(
                  top: 0,
                  right: -37,
                  child: RadioDisc(size: 275, image: widget.image),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}