import 'package:flutter/material.dart';
import 'reusabel_card.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'bmi_calc_brain.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmi;
  final String interpret;
  ResultPage({this.bmi,this.bmiResult,this.interpret});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text(
              'YOur Result',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: TextStyle(fontSize: 25.0, color: Colors.green),
                  ),
                  Text(
                    bmi,
                    style: numberTextStyle,
                  ),
                  Text(
                    interpret,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonName: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
