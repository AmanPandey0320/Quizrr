import 'package:Gossips/models/QuizResult.dart';
import 'package:Gossips/services/database.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  QuizResult quizResult;
  Detail(this.quizResult, {Key key}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text(
          'Quizrr...',
          style: TextStyle(fontFamily: 'PermanentMarker'),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Text(
                'Attempts: ${10 - widget.quizResult.skip}',
                style: TextStyle(
                  fontFamily: 'Righteous',
                  fontSize: 16,
                  color: Colors.brown[600],
                ),
              ),
              Text(
                'Correct: ${widget.quizResult.correct}',
                style: TextStyle(
                  fontFamily: 'Righteous',
                  fontSize: 16,
                  color: Colors.green[600],
                ),
              ),
              Text(
                'Wrong: ${widget.quizResult.wrong}',
                style: TextStyle(
                  fontFamily: 'Righteous',
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              Text(
                'Score: ${widget.quizResult.score}',
                style: TextStyle(
                  fontFamily: 'Righteous',
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            '${widget.quizResult.question.results[index].question.replaceAll('&quot;', '').replaceAll('&#039;', '').replaceAll('&amp;', '').replaceAll('&eacute;', ' ')}\n Answer:\t${widget.quizResult.question.results[index].correctAnswer.replaceAll('&quot;', '').replaceAll('&#039;', '').replaceAll('&amp;', '').replaceAll('&eacute;', ' ')}'),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: widget.quizResult.cloud
                        ? Container()
                        : RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Colors.amber[600],
                            onPressed: () {
                              Database().addquiztoDB(
                                  widget.quizResult.score,
                                  widget.quizResult.wrong,
                                  widget.quizResult.correct,
                                  widget.quizResult.skip,
                                  widget.quizResult.json);
                            },
                            child: Text(
                              'Save quiz',
                              style: TextStyle(
                                fontFamily: 'Righteous',
                                color: Colors.brown[700],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
