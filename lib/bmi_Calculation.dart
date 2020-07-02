import 'dart:math';
class CalculateBmi{
  final int height;
  final int weight;
  double _bmi;
  CalculateBmi(this.height,this.weight);
  String getResult(){
    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getCondition(){
    if(_bmi<18.5){
      return 'underweight';
    }
    else if(_bmi>=18.5 && _bmi<25){
      return 'normal';
    }
    else if(_bmi>=25 && _bmi<30){
      return 'overweight';
    }
    else
      return 'obese';
  }

  String  getDescription(){
    if(_bmi<18.5){
      return 'You have lower than a normal bodyweight';
    }
    else if(_bmi>=18.5 && _bmi<25){
      return 'You have a normal bodyweight.';
    }
    else if(_bmi>=25 && _bmi<30){
      return 'You have higher than a normal bodyweight';
    }
    else
      return 'You have higher than a normal bodyweight';
  }

}