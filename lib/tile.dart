import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final double margin = 15.0;
  final double radius = 10.0;
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  Tile({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: cardChild,
      ),
    );
  }
}
