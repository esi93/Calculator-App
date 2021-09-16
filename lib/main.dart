import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: SimpleCalculator()));
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String question = "";
  String answer = "";
  @override
  Widget build(BuildContext context) {
    TextStyle questionAnswerStyle = TextStyle(color: Color(0xff526F9F));

    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(answer,
                          style: questionAnswerStyle.copyWith(
                              fontSize: 30, color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        question,
                        style: questionAnswerStyle.copyWith(fontSize: 20)
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    calculatorKeys(
                        keynumber: "CLR",
                        onpress: () {
                          setState(() {
                            answer = "";
                            question = "";
                          });
                        })
                  ],
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          calculatorKeys(
                              keynumber: "7",
                              onpress: () {
                                setState(() {
                                  question += "7";
                                });
                              }),
                          calculatorKeys(
                              keynumber: "8",
                              onpress: () {
                                setState(() {
                                  question += "8";
                                });
                              }),
                          calculatorKeys(
                              keynumber: "9",
                              onpress: () {
                                setState(() {
                                  question += "9";
                                });
                              }),
                          calculatorSignskeys(
                              keySign: "+",
                              onpress: () {
                                setState(() {
                                  question += "+";
                                });
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          calculatorKeys(
                              keynumber: "4",
                              onpress: () {
                                setState(() {
                                  question += "4";
                                });
                              }),
                          calculatorKeys(
                              keynumber: "5",
                              onpress: () {
                                setState(() {
                                  question += "5";
                                });
                              }),
                          calculatorKeys(
                              keynumber: "6",
                              onpress: () {
                                setState(() {
                                  question += "6";
                                });
                              }),
                          calculatorSignskeys(
                              keySign: "-",
                              onpress: () {
                                setState(() {
                                  question += "-";
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          calculatorKeys(
                              keynumber: "1",
                              onpress: () {
                                setState(() {
                                  question += "1";
                                });
                              }),
                          calculatorKeys(
                              keynumber: "2",
                              onpress: () {
                                setState(() {
                                  question += "2";
                                });
                              }),
                          calculatorKeys(
                              keynumber: "3",
                              onpress: () {
                                setState(() {
                                  question += "3";
                                });
                              }),
                          calculatorSignskeys(
                              keySign: "x",
                              onpress: () {
                                setState(() {
                                  question += "x";
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          calculatorKeys(
                              keynumber: "0",
                              onpress: () {
                                setState(() {
                                  question += "0";
                                });
                              }),
                          calculatorKeys(
                              keynumber: ".",
                              onpress: () {
                                setState(() {
                                  question += ".";
                                });
                              }),
                          calculatorKeys(
                              keynumber: "=",
                              onpress: () {
                                setState(() {
                                  calculatorResults();
                                });
                              }),
                          calculatorSignskeys(
                              keySign: "/",
                              onpress: () {
                                setState(() {
                                  question += "/";
                                });
                              })
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff1A2640), Color(0xff0D1625)]))));
  }

  calculatorKeys({keynumber, onpress}) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 75,
        width: 75,
        child: Center(
          child: Text(
            keynumber,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
            color: keynumber == "=" ? Color(0xff219595) : Color(0xff1D2E48),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  calculatorSignskeys({keySign, onpress}) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 75,
        width: 75,
        child: Center(
          child: Text(
            keySign,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xff2968C7), borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  void calculatorResults() {
    String finalUserInput = question;
    finalUserInput = question.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);

    ContextModel cm = ContextModel();

    double results = exp.evaluate(EvaluationType.REAL, cm);
    answer = results.toString();
  }
}
