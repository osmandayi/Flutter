// ignore_for_file: deprecated_member_use

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  int height = 180;
  int weight = 60;
  int age = 19;
  double bmi = 0;

  // 1 = male, 2=female
  void updateColour(Gender selectedGender) {
    // male card pressed
    if (selectedGender == Gender.male) {
      if (maleCardColour == kInactiveCardColour) {
        maleCardColour = kActiveCardColour;
        femaleCardColour = kInactiveCardColour;
      } else {
        maleCardColour = kInactiveCardColour;
      }
    }
    // female card pressed
    if (selectedGender == Gender.female) {
      if (femaleCardColour == kInactiveCardColour) {
        femaleCardColour = kActiveCardColour;
        maleCardColour = kInactiveCardColour;
      } else {
        femaleCardColour = kInactiveCardColour;
      }
    }
  }
  // 1 = male, 2=female

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF0A0E21),
        title: const Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xff8d8e98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
                bmi: bmi,
                age: age,
              );
              calc.getResult();
              calc.getInterpretation();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATOR',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

//
// class RoundIconButton extends StatelessWidget {
//   RoundIconButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);
//
//   final Function onPressed;
//   final IconData icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       child: Icon(icon),
//       onPressed: onPressed,
//       elevation: 6.0,
//       disabledElevation: 6.0,
//       constraints: BoxConstraints.tightFor(
//         width: 56.0,
//         height: 56.0,
//       ),
//       shape: CircleBorder(),
//       //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),), --> for be square
//       fillColor: Color(0xff4c4f5e),
//     );
//   }
// }

//
// Column(
// children: [
// Row(
// children: [
// Container(
// color: const Color(0xff101e33),
// margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
// height: 180.0,
// width: 177.5,
// ),
// Container(
// color: const Color(0xff101e33),
// margin: EdgeInsets.only(
// left: 10.0, bottom: 15.0, right: 15.0, top: 15.0),
// height: 180.0,
// width: 177.5,
// ),
// ],
// ),
// Row(
// children: [
// Container(
// color: const Color(0xff101e33),
// margin: EdgeInsets.symmetric(horizontal: 15.0),
// height: 180.0,
// width: 380.0,
// )
// ],
// ),
// Row(
// children: [
// Container(
// color: const Color(0xff101e33),
// margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
// height: 180.0,
// width: 177.5,
// ),
// Container(
// color: const Color(0xff101e33),
// margin: EdgeInsets.only(left: 10.0, right: 15.0, top: 15.0),
// height: 180.0,
// width: 177.5,
// ),
// ],
// ),
// ],
// ),
