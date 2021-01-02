import 'dart:async';

import 'package:Gossips/models/Question.dart';
import 'package:Gossips/models/QuizResult.dart';
import 'package:Gossips/screens/detail.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// ignore: must_be_immutable
class Quiz extends StatefulWidget {
  String string;
  Quiz(this.string, {Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Question question;
  var rand = new Random();
  List<int> correctAns;
  List<String> options = List<String>(5);
  List<String> quizQuestions = List<String>(10);
  List<int> ans = List.generate(10, (index) => 4);
  int qno = 0;
  bool isSubmitted = false;
  QuizResult quizResult;
  int time = 5 * 60;
  Timer timer;
  String json;

  startTimer() {
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time == 0) {
          time = 0;
          AlertDialog alertDialog = new AlertDialog(
            title: Text(
              'Quizrr...',
              style: TextStyle(
                fontFamily: 'PermanentMarker',
                fontSize: 20,
              ),
            ),
            content: Text('Time up!!!'),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
          showDialog(
            context: context,
            builder: (context) => alertDialog,
          );
          timeUpSubmission();
        } else {
          time = time - 1;
        }
      });
    });
  }

  requestSumission() {
    timer.cancel();
    int score = 0;
    int wrong = 0;
    int correct = 0;
    int skip = 0;
    for (int i = 0; i < 10; i++) {
      if (ans[i] != 4) {
        if (ans[i] == correctAns[i])
          correct++;
        else
          wrong++;
      } else
        skip++;

      score = 4 * correct - wrong;
    }
    this.quizResult = new QuizResult(
        question: question,
        score: score,
        wrong: wrong,
        json: json,
        correct: correct,
        cloud: false,
        skip: skip);

    Navigator.pop(context);

    setState(() {
      isSubmitted = true;
    });
  }

  timeUpSubmission() {
    timer.cancel();
    int score = 0;
    int wrong = 0;
    int correct = 0;
    int skip = 0;
    for (int i = 0; i < 10; i++) {
      if (ans[i] != 4) {
        if (ans[i] == correctAns[i])
          correct++;
        else
          wrong++;
      } else
        skip++;

      score = 4 * correct - wrong;
    }
    this.quizResult = new QuizResult(
      question: question,
      score: score,
      wrong: wrong,
      correct: correct,
      skip: skip,
      json: json,
      cloud: false,
    );

    setState(() {
      isSubmitted = true;
    });
  }

  getResult() {
    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 80,
        child: Column(
          children: <Widget>[
            Text('Do you want to submit the quiz?'),
            Center(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () => requestSumission(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      title: Text(
        'Quizrr...',
        style: TextStyle(
          fontFamily: 'ParmanentMarker',
          fontSize: 20,
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  } //get results

  generateQuestions() {
    for (int i = 0; i < 10; i++) {
      quizQuestions[i] = question.results[i].question;
      quizQuestions[i] = quizQuestions[i].replaceAll('&quot;', ' ');
      quizQuestions[i] = quizQuestions[i].replaceAll('&#039;', ' ');
      quizQuestions[i] = quizQuestions[i].replaceAll('&amp;', ' ');
      quizQuestions[i] = quizQuestions[i].replaceAll('&eacute;', ' ');

    }
  }

  generateOptions() {
    int k = 0;
    for (int i = 0; i < 4; i++) {
      if (i == correctAns[qno])
        options[i] = question.results[qno].correctAnswer;
      else {
        options[i] = question.results[qno].incorrectAnswers[k];
        k++;
      }
      options[i] = options[i].replaceAll('&quot;', ' ');
      options[i] = options[i].replaceAll('&#039;', ' ');
    }
    options[4] = 'Skip this question';
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    correctAns = List.generate(10, (index) => rand.nextInt(3));
    json = widget.string;
    this.question = questionFromJson(widget.string);
    generateQuestions();
    generateOptions();
    startTimer();
    //print(question.results[0].question);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isSubmitted
        ? Detail(quizResult)//sending to the details page
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber[600],
              title: Text(
                'Quizerr...',
                style: TextStyle(fontFamily: 'PermanentMarker'),
              ),
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '\n   ${qno + 1}/10\nQuestion:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8),
                    color: Color.fromRGBO(242, 242, 237, 0.8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.89,
                                    child: Text(
                                        quizQuestions[qno]), //assigning qustion
                                  ),
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Options',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(options[0]),
                            leading: Radio(
                              value: 0,
                              groupValue: ans[qno],
                              onChanged: (value) {
                                setState(() {
                                  ans[qno] = 0;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(options[1]),
                            leading: Radio(
                              value: 1,
                              groupValue: ans[qno],
                              onChanged: (value) {
                                setState(() {
                                  ans[qno] = 1;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(options[2]),
                            leading: Radio(
                              value: 2,
                              groupValue: ans[qno],
                              onChanged: (value) {
                                setState(() {
                                  ans[qno] = 2;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(options[3]),
                            leading: Radio(
                              value: 3,
                              groupValue: ans[qno],
                              onChanged: (value) {
                                setState(() {
                                  ans[qno] = 3;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text(options[4]),
                            leading: Radio(
                              value: 4,
                              groupValue: ans[qno],
                              onChanged: (value) {
                                setState(() {
                                  ans[qno] = 4;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: qno == 9
                        ? Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlatButton(
                                    onPressed: () {
                                      //backward
                                      if (qno > 0) {
                                        setState(() {
                                          qno--;
                                          generateOptions();
                                        });
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Color.fromRGBO(255, 208, 0, 1),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    )),
                                FlatButton(
                                  onPressed: () {
                                    //submit
                                    getResult();
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Color.fromRGBO(255, 208, 0, 1),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Righteous',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlatButton(
                                    onPressed: () {
                                      //backward
                                      if (qno > 0) {
                                        setState(() {
                                          qno--;
                                          generateOptions();
                                        });
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Color.fromRGBO(255, 208, 0, 1),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    )),
                                FlatButton(
                                  onPressed: () {
                                    //submit
                                    getResult();
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Color.fromRGBO(255, 208, 0, 1),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Righteous',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                FlatButton(
                                    onPressed: () {
                                      //forward
                                      if (qno < 9) {
                                        setState(() {
                                          qno++;
                                          generateOptions();
                                        });
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Color.fromRGBO(255, 208, 0, 1),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                  ),
                  isSubmitted
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            '${time ~/ 60}:${time % 60}',
                            style: TextStyle(
                              fontFamily: 'Righteous',
                              fontSize: 36,
                            ),
                          ),
                        )
                ],
              ),
            ),
          );
  }
}
