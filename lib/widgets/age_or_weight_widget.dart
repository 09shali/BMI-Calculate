import 'package:bmi_calculate_app/widgets/custom_circle_button.dart';
import 'package:flutter/material.dart';

class AgeAndWeightWidget extends StatelessWidget {
  const AgeAndWeightWidget({
    @required this.title, 
    @required this.ageOrWeight, 
    @required this.decrement, 
    @required this.inrement,
    Key key, 
  }) : super(key: key);


  final String title;
  final String ageOrWeight;
  final Function() decrement;
  final Function() inrement;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          Text(
            ageOrWeight,
          style: TextStyle(
            fontSize: 30.0,
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCircleButton(
                buttonText: '-',
                onPressed: decrement,
              ),
              const SizedBox(width: 5.0,),
               CustomCircleButton(
                buttonText: '+',
                onPressed: inrement,
              ),
            ],
          ),
        ],
      ),
    );
  }
}



