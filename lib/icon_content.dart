import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String iconText;

  IconContent({@required this.iconText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 10.0),
        Icon(icon, size: iconSize),
        SizedBox(height: 15.0),
        Text(iconText, style:TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)))
      ],
    );
  }
}