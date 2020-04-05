import 'package:bmi_calculator/bmr_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tile.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'result_screen.dart';

enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  double calculatedBMR;
  int age = 20;
  int minWeight = 30;
  int weight = 60;
  int height = 150;
  Gender selectedGender = Gender.male;
  Color maleCardColour = altColour;
  Color femaleCardColour = altColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMR CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:
            Row(children: <Widget>[
              Expanded(
                  child: Tile(
                    onPress: (){
                      setState(() {selectedGender = Gender.male;});
                    },
                    colour: selectedGender ==  Gender.male ? cardColour : altColour,
                    cardChild: IconContent(iconText: "Male", icon: FontAwesomeIcons.mars),
                  )),
              Expanded(child:  Tile(
                    onPress: (){
                      setState(() {selectedGender = Gender.female;});
                    },
                    colour: selectedGender == Gender.female ? cardColour : altColour,
                    cardChild: IconContent(iconText: "Female", icon: FontAwesomeIcons.venus),
                  ))
            ])),
          Expanded(
            child: Tile(
              colour: cardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text("Height", style: labelStyle),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(height.toString(), style: headerStyle),
                    Text("cm", style: labelStyle),
                  ],
                ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.white10,
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x159B7CC4),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: bottomNavColour,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newVal){
                        setState(() {
                          height = newVal.round();
                        });
                      },
                      min: minHeight,
                      max: maxHeight,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child:
            Row( children: <Widget>[
              Expanded(
                  child: Tile(
                    colour: cardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Weight", style: labelStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(weight.toString(), style: headerStyle,),
                            Text("Kg", style: labelStyle,),
                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: (){
                              setState(() {
                                weight == minWeight ? weight = weight : weight--;
                              });
                            },
                          ),
                          SizedBox(width: 15.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: (){
                              setState(() {
                                 weight++;
                              });
                            },
                          ),
                        ],)
                      ],
                    ),
                  ),
              ),
              Expanded(
                child:Tile(
                  colour: cardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Age", style: labelStyle),
                      Text(age.toString(), style: headerStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: (){
                              setState(() {
                                age == 0 ? age = age : age--;
                              });
                            },
                          ),
                          SizedBox(width: 15.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: (){
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ])),
          GestureDetector(
            onTap: (){
              BMR_Brain calculator = BMR_Brain(gender: selectedGender, weight: weight  , height: height, age: age);
              if(selectedGender == null){
                print("select gender first");
              }else{
                calculatedBMR = calculator.calculateBMR();
              }
              print(calculatedBMR.round().toString());
              Navigator.push(context, MaterialPageRoute(builder: (context) { return ResultScreen(
                bmrResult: calculatedBMR.round().toString(),
                bmrResultText: calculator.displayResult(),
              );} ));
            },
            child: Container(
              child: Center(child: Text("Calculate", style: headerStyle, textAlign: TextAlign.center)),
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
