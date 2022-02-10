import 'dart:developer';

import 'package:bmi_calculate_app/brain/bmi_brain.dart';
import 'package:bmi_calculate_app/widgets/age_or_weight_widget.dart';
import 'package:bmi_calculate_app/widgets/bmi_result_page.dart';
import 'package:bmi_calculate_app/widgets/custom_card.dart';
import 'package:bmi_calculate_app/widgets/custom_circle_button.dart';
import 'package:bmi_calculate_app/widgets/custom_main_button.dart';
import 'package:bmi_calculate_app/widgets/gender_widget.dart';
import 'package:bmi_calculate_app/widgets/height_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


enum Gender {NONE, MALE, FEMALE}

class BmiCalculate extends StatefulWidget {
  const BmiCalculate({ Key key }) : super(key: key);

  @override
  _BmiCalculateState createState() => _BmiCalculateState();
}


class _BmiCalculateState extends State<BmiCalculate> {


  double _height = 170;
  int _weight = 60;
  int _age = 18;

  Color _selectedColor = Color(0xFF24263B);
  Color _unselectedColor = Color(0xFF161824);

  bool _maleSelected = false;
  bool _femaleSelected = false;

  Gender _gender = Gender.NONE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        ),
      body: SafeArea(
        child: 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  
                      // _buildContainer(FontAwesomeIcons.mars, 'MALE'),
                       const SizedBox(height: 20.0,),   
                    CustomCard(
                    bgColor: 
                    _gender == Gender.MALE ? _selectedColor: _unselectedColor,
                    child: GenderWidget(
                      icon: FontAwesomeIcons.mars, 
                      text: 'MALE',
                      onTap: (){
                        setState(() {
                          _gender = Gender.MALE;
                        });
                      },
                      ),
                    ),
                  SizedBox(width: 20,),
                  CustomCard(
                    bgColor:
                     _gender == Gender.FEMALE ? _selectedColor: _unselectedColor,
                    child: GenderWidget(
                      icon: FontAwesomeIcons.venus, 
                      text: 'FEMALE',
                      onTap: (){
                        setState(() {
                           _gender = Gender.FEMALE;
                        });
                      },
                      ),
                    // icon: FontAwesomeIcons.venus, 
                    // text: 'FEMALE',
                    ),
                                
                  
                    ],
                  ), 
                  
                    
                  const SizedBox(height: 20.0,),           
                  CustomCard(
                    bgColor: Color(0xFF24263B),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22.0),
                      child: HeightWidget(
                        sliderValue: _height,
                        onChange: (double ozgorgon){
                          setState(() {
                            _height = ozgorgon;
                          });
                        },
                        ),
                    )
                  ),
                   const SizedBox(height: 20.0,),  
                   Row(
                     children: [
                     CustomCard(
                       bgColor: Color(0xFF24263B),
                       child: AgeAndWeightWidget(
                         title: 'WEIGHT',
                         ageOrWeight: _weight.toString(),
                         decrement: (){
                           setState(() {
                             _weight--;
                           });
                         },
                         inrement: (){
                           setState(() {
                             _weight++;
                           });
                         },
                       ),
                     ),
                     const SizedBox(width: 20,),
                     CustomCard(
                       bgColor: Color(0xFF24263B),
                       child: AgeAndWeightWidget(
                         title: 'AGE',
                         ageOrWeight: _age.toString(),
                         decrement: (){
                           setState(() {
                             _age--;
                           });
                         },
                         inrement: (){
                           setState(() {
                             _age++;
                           });
                         },
                       ),
                     ),
                   ],
                       
                   ),

                   const SizedBox(height: 20.0,), 
              // Positioned(
              // bottom: 0,
              // child: SizedBox(
              //       width: MediaQuery.of(context).size.width,
              //       height: 60,
              //       child: InkWell(
              //         onTap: (){},
              //         child: Container(
              //           color: Colors.red,
              //           child: Center(child: Text('CALCULATE',
              //           style: TextStyle(fontSize: 25.0),)),
              //         ),
              //       ),
              //     ),
              // ),
                  
                ],
              ),
            ),
            
        
      ),
      bottomNavigationBar: CustomMainButton(
        buttonText: 'Calculate',
        onPressed: (){
         Navigator.push
          (context, 
          MaterialPageRoute
          (builder: (context)=>BmiResultPage(
             bmiResult: bmiBrain.calculateBmi(_weight, _height),
             ),
             ),
             );
          
        },
      ),
    );
  }

  // bul jon gana misal? bul kodtu koldonboybuz
  // orduna biz jasagan Widgetterdi
  _buildContainer(IconData icon, String text){
    return   Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF24263B),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:28.0),
                    child: Column(
                      children: [
                        FaIcon(
                        icon,
                        size: 85.0,),
                        Text(
                          text,
                          style: TextStyle(fontSize: 25.0),
                        )
                      ],
                    ),
                  ),
                ),
              );
  }
}



