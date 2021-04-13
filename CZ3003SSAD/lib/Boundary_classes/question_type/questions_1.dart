import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ssadgame/Controller/LoadQuestion.dart';
import 'package:ssadgame/game_engine/ControlData.dart';
// void main() => runApp(MaterialApp(
//       home: mcq1(),
//     ));

class mcq1 extends StatefulWidget {
  final ControlData test;
  mcq1({this.test});
  @override
  _mcq1State createState() => _mcq1State();
}

class _mcq1State extends State<mcq1> {
  int mcqID = -1;
  List<String> answers = ["", "", "", ""];
  String question = "";

  @override
  void initState() {
    super.initState();
    print("It should have printed");
    print(widget.test.numberOfQuestionsLeft.toString());
    initTest();
  }

  initTest() async {
    //print the statement of control data
    print("Reaches here");
    mcqID = await widget.test.getMcqQuestion();
    //mcqID = await widget.test.getQuestion();
    McqQuestion qn = await LoadQuestions.getMcq(mcqID);
    setState(() {
      question = qn.question;
      List<String> temp = [];
      for (int i = 0; i < qn.answers.length; i++) {
        temp.add(qn.answers[i]);
        //print(qn.answers[i]);
      }
      answers = temp;
    });
    //print(qn.question);
    // question = qn.question;
    // print(qn.answers.length);
    // for (int i = 0; i < qn.answers.length; i++) {
    //   answers.add(qn.answers[i]);
    //   print(qn.answers[i]);
    // }
  }

  bool _button1HasBeenPressed = false;
  bool _button2HasBeenPressed = false;
  bool _button3HasBeenPressed = false;
  bool _button4HasBeenPressed = false;
  int _answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: true,
        right: true,
        top: true,
        bottom: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 70,
                  width: 125,
                  alignment: Alignment.center,
                  child: Text(
                    "Level " + widget.test.level.toString(),
                    style: TextStyle(
                      fontFamily: "Orbitron",
                      fontSize: 20.0,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    width: 192,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Score: " + widget.test.getScoreFormat(),
                          style: TextStyle(
                            fontFamily: "Orbitron",
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                    )),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  height: 200,
                  // width: 90,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        question,
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        primary: Colors.grey[400],
                        onPrimary: Colors.black,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 100,
                  width: 470,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        answers[0],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 100,
                  width: 470,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        answers[1],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 100,
                  width: 470,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        answers[2],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 100,
                  width: 470,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        answers[3],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      )),
                ),
                Container(
                    width: 90,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, "true");
                        },
                        child: Text("Next",
                            style: TextStyle(
                              fontFamily: "Orbitron",
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            width: 1.0,
                            color: Colors.black,
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          primary: Colors.grey[200],
                          onPrimary: Colors.black,
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
