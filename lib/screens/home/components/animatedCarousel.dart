import 'package:flutter/material.dart';

import '../../../../size_config.dart';


class AnimatedCarousel extends StatefulWidget {

  final List<Widget> children;
  final int initialIndex;
  final Function(int index)? onItemChanged;
  const AnimatedCarousel({Key? key, required this.children, this.initialIndex = 0, this.onItemChanged}) : super(key: key);

  @override
  State<AnimatedCarousel> createState() => _AnimatedCarouselState();
}

class _AnimatedCarouselState extends State<AnimatedCarousel> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _leftToRightItem;
  late Animation<Offset> _rightToCenterItem;
  late Animation<Offset> _centerToLeftItem;
  late Animation<double> _centerSizeItem;

  double incrDx = 0.0;

  int currentIndex = 0;
  List<int> dispChildren = [-1, 0, 1];
  bool isReversed = false;
  bool shouldRepaint = false;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.initialIndex;
    dispChildren = [currentIndex-1, currentIndex, currentIndex+1];
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addStatusListener(updateDisplayChildren);

    _leftToRightItem = Tween<Offset>(
      begin: Offset(getProporcionalWidth(-16), getProporcionalHeight(90)),
      end: Offset(getProporcionalWidth(287), getProporcionalHeight(90)),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      )
    );

    _rightToCenterItem = Tween<Offset>(
      begin: Offset(getProporcionalWidth(287), getProporcionalHeight(90)),
      end: Offset(getProporcionalWidth(68), getProporcionalHeight(36)),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      )
    );

    _centerToLeftItem = Tween<Offset>(
      begin: Offset(getProporcionalWidth(68), getProporcionalHeight(36)),
      end: Offset(getProporcionalWidth(-16), getProporcionalHeight(90)),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      )
    );

    _centerSizeItem = Tween<double>(
      begin: getProporcionalWidth(0),
      end: getProporcionalWidth(137),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    isReversed ? isReversed = false : _controller.reset();
    return GestureDetector(
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, constShild) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                // Initial Left Item
                Positioned(
                  width: getProporcionalWidth(118),
                  height: getProporcionalWidth(118),
                  bottom: _leftToRightItem.value.dy,
                  left: _leftToRightItem.value.dx,
                  child: dispChildren[0] < 0 || dispChildren[0] >= widget.children.length
                    ? const CarouselItem()
                    : widget.children[dispChildren[0]],
                ),

                // Initial Right Item
                Positioned(
                  width: getProporcionalWidth(118) + _centerSizeItem.value,
                  height: getProporcionalWidth(118) + _centerSizeItem.value,
                  bottom: _rightToCenterItem.value.dy,
                  left: _rightToCenterItem.value.dx,
                  child: dispChildren[2] >= widget.children.length 
                    ? const CarouselItem() 
                    : widget.children[dispChildren[2]],
                ),

                // Initial Center Item
                Positioned(
                  width: getProporcionalWidth(255) - _centerSizeItem.value,
                  height: getProporcionalWidth(255) - _centerSizeItem.value,
                  bottom: _centerToLeftItem.value.dy,
                  left: _centerToLeftItem.value.dx,
                  child: dispChildren[1] < 0 
                    ? const CarouselItem() 
                    : widget.children[dispChildren[1]],
                ),
              ],
            );
          },
        ),
      ),
      onHorizontalDragEnd: (data) {
        if(incrDx >= 50 && currentIndex > 0){
          dispChildren = [currentIndex+1, currentIndex-1, currentIndex];
          setState(() => isReversed = true);
          _controller.reverse(from: 0.999);
        } else if(incrDx <= -50 && currentIndex < widget.children.length-1) {
          _controller.forward(from: 0.001);
        }
        incrDx = 0.0;
      },
      onHorizontalDragUpdate: (data) {
        incrDx += data.delta.dx;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateDisplayChildren(AnimationStatus status) {
    if(status == AnimationStatus.completed){
      currentIndex += 1;
      widget.onItemChanged!(currentIndex);
      dispChildren = [currentIndex-1, currentIndex, currentIndex+1];
      setState(() => shouldRepaint = true);
    } else if(status == AnimationStatus.dismissed){
      if(shouldRepaint){
        shouldRepaint = false;
      } else {
        currentIndex -= 1;
        widget.onItemChanged!(currentIndex);
        dispChildren = [currentIndex-1, currentIndex, currentIndex+1];
      }
    }
  }
}

class CarouselItem extends StatelessWidget {

  final Color color;
  const CarouselItem({Key? key, this.color = const Color(0x00000000),}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}