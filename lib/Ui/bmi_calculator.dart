
import 'dart:math';

import 'package:bmi_calculator_app/Ui/BMI.dart';
import 'package:bmi_calculator_app/Util/colors.dart';
import 'package:bmi_calculator_app/main.dart';
import 'package:flutter/material.dart';



enum Conclicked { contA, contB }
var mic = BMI(0, 0, 0);
var operation;
var status;
class BmiApp extends StatefulWidget {
  const BmiApp({super.key});

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  var clickMe;
  bool isClicked = false;
  Color _color = Colors.red;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 14,
            vertical: MediaQuery.of(context).size.width / 6),
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 60.0),
                child: const Text(
                  'BMI CALCULATOR',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 24.0),
                ),
              ),
              Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  clickMe = Conclicked.contA;
                                });
                              },
                              child: Container(
                                height: 165,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0),
                                decoration: BoxDecoration(
                                  color: clickMe == Conclicked.contA
                                      ? Colors.green
                                      : primaryLight,
                                ),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_up,
                                      size: 88.0,
                                      color: clickMe == Conclicked.contA? onPrimary : Colors.black ,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('MALE', style:
                                      clickMe == Conclicked.contA?
                                      theme.textTheme.displaySmall :
                                      theme.textTheme.headlineMedium,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  clickMe = Conclicked.contB;
                                });
                              },
                              child: Container(
                                height: 165,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0),
                                color: clickMe == Conclicked.contB
                                    ? Colors.green
                                    : primaryLight,
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_up,
                                      size: 88.0,
                                      color: clickMe == Conclicked.contB? onPrimary : Colors.black ,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('FEMALE',style:
                                      clickMe == Conclicked.contB?
                                      theme.textTheme.displaySmall
                                          : theme.textTheme.headlineMedium,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
              Card(
                elevation: 5,
                margin: const EdgeInsets.only(top: 35.0, bottom: 35.0),
                child: Container(
                  child: Card(
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text('HEIGHT',style: theme.textTheme.headlineMedium,),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text.rich(TextSpan(
                              children: [
                                TextSpan(text: '${mic.height}',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.bold
                                )),
                                TextSpan(text: 'cm', style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0
                                ))
                              ]
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Slider(
                                min: 0,
                                max: 2000,
                                value: mic.height.toDouble(),
                                onChanged: (double value) {
                                  setState(() {
                                    mic.height = value.round();
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Container(
                        height: 180,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text('WEIGHT',style: theme.textTheme.headlineMedium,),
                            ),
                            Text('${mic.weight}',style: theme.textTheme.bodyLarge,),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (mic.weight > 0) {
                                          mic.weight--;
                                        } else {
                                          //  do nothing
                                        }
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: primary900,
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      child: const Text(
                                        '-',
                                        style: TextStyle(fontSize: 40.0,
                                        color: Colors.white70),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        mic.weight++;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: primary900,
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      child: const Center(
                                        child: Text(
                                          "+",
                                          style: TextStyle(fontSize: 40.0,
                                          color: Colors.white70),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 1.0,
                  ),
                  Expanded(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Container(
                        height: 180,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text('AGE',style: theme.textTheme.headlineMedium,),
                            ),
                            Text('${mic.age}',style: theme.textTheme.bodyLarge,),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (mic.age > 0) {
                                          mic.age--;
                                        } else {
                                          //  do nothing
                                        }
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: primary900,
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      child: const Center(
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                              fontSize: 40.0,
                                            color: Colors.white70
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        mic.age++;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: primary900,
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      child: const Center(
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              fontSize: 40.0,
                                          color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            double c = mic.height/100;
            int exp = 2;
            if(mic.weight > 0 && mic.height > 0 && mic.age > 0) {
              setState(() {
                operation = (mic.weight / pow(c, exp)).toStringAsFixed(1);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  BmiAppDetails()));
                print(operation);
              });
            }
            if(double.parse(operation) < 18.5) {
              setState(() {
                status = 'You are underweight take care of yourself';
                print(status);

              });
            }
            if(double.parse(operation)>= 18.5 && double.parse(operation)<= 25) {
              setState(() {
                status = 'You have a normal body weight.Good job!';
              });
            }
            if (double.parse(operation) > 25){
              setState(() {
                status = 'You are becoming obese go see a doctor';
              });
            }

          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:  Text(
              'CALCULATE YOUR BMI',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}

class BmiAppDetails extends StatefulWidget {
  @override
  State<BmiAppDetails> createState() => _BmiAppDetailsState();
}

class _BmiAppDetailsState extends State<BmiAppDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child:  Text('RE-CALCULATE YOUR BMI',style: theme.textTheme.bodySmall,),
            )),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 14,
            vertical: MediaQuery.of(context).size.width / 6),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 44.0),
                child: const Text(
                  'BMI  CALCULATOR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                  textAlign: TextAlign.center,
                ),
              ),
               Text(
                'Your Result',
                style: theme.textTheme.displayLarge,
              ),
              Card(
                elevation: 5,
                  margin: const EdgeInsets.only(top: 38.0, bottom: 22.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 36.0,horizontal: 16.0),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                          child: Text(
                        'NORMAL',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 23.0,
                            letterSpacing: 0.5),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                            child: Text('$operation',
                          style: theme.textTheme.displayLarge,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Center(
                            child: Text(
                          'Normal BMI range:',
                          style: theme.textTheme.headlineSmall,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26.0),
                        child: Center(
                            child: Text(
                          '18,5 - 25kg/m2',
                          style: theme.textTheme.bodySmall,
                        )),
                      ),
                      Center(
                          child: Text( '$status',
                        style: theme.textTheme.bodySmall,
                        softWrap: true,
                            textAlign: TextAlign.center,
                      )),
                       Card(
                         margin: const EdgeInsets.only(top: 22.0),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(16.0)
                         ),
                         child: TextButton(
                           style: TextButton.styleFrom(
                             backgroundColor: primary900
                           ),
                           onPressed: null,
                           child:  Container(
                         alignment: Alignment.center,
                         padding: EdgeInsets.symmetric(horizontal: 10.0),
                         constraints: BoxConstraints.expand(
                           width: 150,
                           height: 40
                         ),

                         child: Text(
                         'SAVE RESULT',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 18.0,
                           letterSpacing: 0.5),
                           ),
                           ),
                         ),
                       )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
