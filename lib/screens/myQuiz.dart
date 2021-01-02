import 'package:Gossips/models/Question.dart';
import 'package:Gossips/models/QuizResult.dart';
import 'package:Gossips/screens/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Gossips/services/database.dart';
import 'package:provider/provider.dart';

class MyQuiz extends StatefulWidget {
  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: Database().allQuiz,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[600],
          title: Text(
            'Quizerr...',
            style: TextStyle(fontFamily: 'PermanentMarker'),
          ),
        ),
        body: Container(
          child: QuizList(),
        ),
      ),
    );
  }
}

//quiz list
class QuizList extends StatefulWidget {
  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuerySnapshot>(context);
    var _myquizes = quiz.docs;
    return Container(
      child: ListView.builder(
        itemCount: _myquizes.length,
        itemBuilder: (context, index) {
          String time = _myquizes[index].data()['time'];
          var score = _myquizes[index].data()['score'];
          var wrong = _myquizes[index].data()['wrong'];
          var correct = _myquizes[index].data()['correct'];
          var skip = _myquizes[index].data()['skip'];
          var json = _myquizes[index].data()['json'];

          Question question = questionFromJson(json);
          QuizResult result = QuizResult(
              question: question,
              correct: correct,
              wrong: wrong,
              skip: skip,
              cloud: true,
              score: score);

          return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(result),
                    ));
              },
              title: Card(
                  child: Container(
                    child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('${time.substring(0,19)}',
                          style: TextStyle(
                            fontFamily: 'Righteous',
                          ),
                          ),
                        ),
                      ),
                      Align(alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Score: $score\t\t Correct: $correct \t\t Wrong: $wrong\t\t Skip: $skip'),
                      ),
                      ),
                      Align(alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Details>>'),
                      ),
                      ),
                    ],
                ),
                  ),
              ));
        },
      ),
    );
  }
}
