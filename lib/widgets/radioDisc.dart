import 'package:flutter/material.dart';
import 'package:web_radio_player/constants.dart';


class RadioDisc extends StatelessWidget {

  final double size;
  final String image;
  const RadioDisc({Key? key, required this.size, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 4,
          // color: kSecondaryColor,
          color: kSecondaryColor.withOpacity(0.2),
          // color: const Color(0x33666666),
          style: BorderStyle.solid,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: defBorderCircle,
        child: Image.network(
          image,
          fit: BoxFit.cover,
          // loadingBuilder: (ctx, widgetChild, chunk) => Container(color: kPrimaryColor,),
          // errorBuilder: ((context, error, stackTrace) => Image.asset("")),
        ),
      ),
    );
  }
}