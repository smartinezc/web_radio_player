import 'package:flutter/material.dart';
import 'package:web_radio_player/constants.dart';

import '../../../size_config.dart';
import '../../../widgets/radioDisc.dart';
import './actionButtons.dart';
import './animatedCarousel.dart';
import '../../../widgets/radioTitle.dart';


class Body extends StatefulWidget {

  final Function(String image) onItemChanged;
  final List radios;
  const Body({Key? key, required this.onItemChanged, required this.radios}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  RadioTitle? titleToDisplay;

  @override
  void initState() {
    super.initState();
    titleToDisplay = RadioTitle(widget.radios[1].name, widget.radios[1].frequency, key: ValueKey(widget.radios[1].id));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getProporcionalHeight(24)),
          const ActionButtons(),
          SizedBox(height: getProporcionalHeight(122)),
          AnimatedSwitcher(
            duration: kAnimationDuration,
            child: titleToDisplay,
          ),
          SizedBox(height: getProporcionalHeight(16)),
          AnimatedCarousel(
            height: 300,
            width: 350,
            initialIndex: 1,
            onItemChanged: (n) {
              titleToDisplay = RadioTitle(widget.radios[n].name, widget.radios[n].frequency, key: ValueKey(widget.radios[n].id));
              widget.onItemChanged(widget.radios[n].image);
              setState(() {});
            },
            children: List<Widget>.generate(widget.radios.length, (n) {
              return InkWell(
                key: ValueKey(widget.radios[n].id),
                onTap: () {
                  Navigator.of(context).pushNamed("/radioPlayer", arguments: widget.radios[n]);
                },
                child: RadioDisc(
                  size: 255,
                  image: widget.radios[n].image,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}