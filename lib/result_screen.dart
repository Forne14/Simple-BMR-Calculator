import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';
import 'tile.dart';

class ResultScreen extends StatefulWidget {
  final String bmrResult;
  final String bmrResultText;
  ResultScreen({@required this.bmrResult, @required this.bmrResultText});
  @override
  _ResultScreenState createState() => _ResultScreenState(bmrResult: bmrResult, bmrResultText: bmrResultText);
}

class _ResultScreenState extends State<ResultScreen> {
  final String bmrResult;
  final String bmrResultText;

  _ResultScreenState({@required this.bmrResult, @required this.bmrResultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(child: Center(child: Text("Your Result", style: headerStyle,))),
        Expanded(
            flex: 5,
            child: Tile( 
              colour: cardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(bmrResultText, style: resultStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(bmrResult, style: headerStyle2),
                      Text("Kcal per day", style: resultStyle,)
                  ],
                  ),
                  Text("Your BMR measures the rate at which your body uses energy for basic life support needs. I.e. if you were laying in bed doing nothing ", style: bodyStyle,),
                  Text("This tool calculates your BMR to give you an idea of where your bodys at.", style: bodyStyle)
              ],),
            )),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            child: Center(child: Text("Re-Calculate", style: headerStyle, textAlign: TextAlign.center)),
            decoration: BoxDecoration(
                color: bottomNavColour,
                borderRadius: BorderRadius.circular(5.0)
            ),
            height: bottomHeight,
            padding: EdgeInsets.only(bottom: 13.0),
            margin: bottomNavMargin,
            width: double.infinity,
          ),
        )
      ],
    )
    );
  }
}
