import 'package:flutter/material.dart';
import 'input_page.dart';
class BMR_Brain {
  double calcd;
  Gender gender;
  int weight;
  int height;
  int age;

  BMR_Brain({@required this.gender, @required this.weight, @required this.height, @required this.age});

  double calculateBMR(){
    if(gender == Gender.male){
       calcd = 66.47 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
    }else if(gender == Gender.female){
      calcd = 655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age);
    }
    return calcd;
  }

  String displayResult(){
    if(calcd == null){
      return "Enter Data please";
    }else if(calcd < 1600){
      return "Slow";
    }else if(calcd >= 1600 && calcd <= 1900){
      return "Normal";
    }else{
      return "Fast";
    }
  }
}