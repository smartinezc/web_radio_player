import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../constants.dart';
import './radioGridItem.dart';

class RadioGrid extends StatefulWidget {
  final List radios;
  final Function(String id) toggleFavorite;
  const RadioGrid(this.radios, this.toggleFavorite, {Key? key}) : super(key: key);

  @override
  State<RadioGrid> createState() => _RadioGridState();
}

class _RadioGridState extends State<RadioGrid> {

  late List<AnimatedPositioned> stackList;
  bool shouldRepaint = true;

  @override
  Widget build(BuildContext context) {
    shouldRepaint ? updateStackList() : shouldRepaint = true;
    return Padding(
      padding: defScreenPadding,
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight - 200,
          child: Stack(
            clipBehavior: Clip.none,
            children: stackList,
          ),
        ),
      ),
    );
  }

  void updateStackList() {
    stackList = List.generate(widget.radios.length, (n) {
      return AnimatedPositioned(
        key: ValueKey(n),
        duration: kAnimationDuration,
        curve: Curves.fastOutSlowIn,
        left: n%2 == 0 ? 0 : getProporcionalWidth(170),
        top: (n/2).floorToDouble()*getProporcionalHeight(215),
        child: RadioGridItem(
          radio: widget.radios[n],
          toggleFavorite: widget.toggleFavorite,
          willPlay: selectedGridItem,
          endPlay: finishPlay,
        ),
      );
    });
  }

  void selectedGridItem(String radioID) {
    AnimatedPositioned last = stackList.firstWhere((pos) => (pos.child as RadioGridItem).radio.id == radioID);
    stackList.removeWhere((pos) => (pos.child as RadioGridItem).radio.id == radioID);
    last = AnimatedPositioned(
      key: last.key,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      left: 0,
      top: last.top,
      child: last.child,
    );
    stackList.add(last);
    setState(() {
      shouldRepaint = false;
    });
  }

  void finishPlay() {
    setState(() => shouldRepaint = true);
  }
}