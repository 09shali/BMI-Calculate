import 'package:bmi_calculate_app/brain/bmi_brain.dart';
import 'package:bmi_calculate_app/widgets/custom_card.dart';
import 'package:bmi_calculate_app/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';

class BmiResultPage extends StatelessWidget {
const BmiResultPage({ @required this. bmiResult, Key key }) : super(key: key);

  final double bmiResult;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Your result'.toUpperCase()),
        centerTitle: true,
        ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.9,
          child: CustomCard(
            bgColor: Color(0xFF323244),
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  bmiBrain.getResult(bmiResult),
                style: TextStyle(
                  color: Color(0xFF43DA8C),
                  fontSize: 20,
                fontWeight: FontWeight.bold,),
                ),
                Text(
                  bmiResult.toStringAsFixed(1),
                style: TextStyle(fontSize: 100,
                fontWeight: FontWeight.bold,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    bmiBrain.getInterpretation(bmiResult),
                    textAlign: TextAlign.center
                  ),
                ),
                
              ],
            )),
          ),
        ),
      ),
      bottomNavigationBar:  CustomMainButton(
        buttonText: 'Re-Calculate',
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}