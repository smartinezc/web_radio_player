import 'package:flutter/material.dart';
import 'package:web_radio_player/constants.dart';


class RadioDisc extends StatelessWidget {

  final double size;
  final String image;
  const RadioDisc({Key? key, required this.size, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RadioDiscClipper(),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: kSecondaryColor.withOpacity(0.8),
            style: BorderStyle.solid,
          ),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return Center(
              child: Container(
                height: constraints.maxWidth*0.26,
                decoration: const BoxDecoration(
                  color: kSecondaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RadioDiscClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    return Path()
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width+20, size.height+20))
      ..addOval(Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: size.width*0.11))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

}