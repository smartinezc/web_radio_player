import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import './pageSelectorTitle.dart';

class PageSelector extends StatefulWidget {
  final Function(bool state) callback;
  const PageSelector(this.callback, {Key? key}) : super(key: key);

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {

  bool onFavorites = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defScreenPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  widget.callback(true);
                  setState(() => onFavorites = true);
                },
                child: PageSelectorTitle(
                  title: "Favorites",
                  isActive: onFavorites,
                ),
              ),
              SizedBox(width: getProporcionalWidth(50)),
              InkWell(
                onTap: () {
                  widget.callback(false);
                  setState(() => onFavorites = false);
                },
                child: PageSelectorTitle(
                  title: "All",
                  isActive: !onFavorites,
                ),
              ),
            ],
          ),
          AnimatedSlide(
            duration: kAnimationDuration,
            offset: onFavorites ? const Offset(-1.9, 0) : const Offset(1.9, 0),
            child: Container(
              width: getProporcionalWidth(45),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF666666), width: 2),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}