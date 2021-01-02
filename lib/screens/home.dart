import 'package:Gossips/screens/myQuiz.dart';
import 'package:Gossips/screens/profile.dart';
import 'package:Gossips/screens/quiz.dart';
import 'package:Gossips/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  sentToQuiz(url) async {
    AlertDialog alertDialog = new AlertDialog(
      title: Text(
        'Quizrr...',
        style: TextStyle(fontFamily: 'PermanentMarker'),
      ),
      content: Row(
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('Loding Quiz\nPlease wait'),
          )
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => alertDialog,
    );
    final res = await http.get(url);

    Navigator.pop(context);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Quiz(res.body)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text(
          'Quizerr...',
          style: TextStyle(fontFamily: 'PermanentMarker'),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Card(
            //1
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Color.fromRGBO(66, 135, 245, 1),
            child: InkWell(
              splashColor: Colors.white.withAlpha(50),
              onTap: () {
                sentToQuiz(
                    'https://opentdb.com/api.php?amount=10&type=multiple');
              },
              child: Container(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/quiz1.png'))),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                      child: Text(
                        'Random Quiz',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Righteous',
                        ),
                      ),
                    )),
                width: MediaQuery.of(context).size.width / 2.2,
                height: 90,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                //2
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(245, 117, 66, 1),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=9&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/quiz.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'General Knowledge',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
              Card(
                //3
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(120, 72, 37, 1),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=10&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/book.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'Books',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                //4
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(242, 203, 5, 1),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=11&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/movie.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'Movies',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
              Card(
                //5
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(56, 232, 79, 1),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=12&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/disc.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'Music',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                //6
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(165, 175, 176, 1),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=14&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/television.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'T.V. show',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
              Card(
                //7
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(240, 244, 245, 1),
                child: InkWell(
                  splashColor: Colors.grey.withAlpha(40),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=17&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/planet-earth.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'Nature',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                //8
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(175, 125, 240, 1),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=18&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/desktop-computer.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'Computer',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
              Card(
                //9
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(232, 70, 72, 1),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=21&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/running.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'Sports',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                //10
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(191, 245, 240, 1),
                child: InkWell(
                  splashColor: Colors.grey[400].withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=22&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/map.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'Geography',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
              Card(
                //11
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(105, 42, 16, 1),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=23&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/history.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'History',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                //12
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(66, 135, 245, 1),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=26&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/celebs.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'Celebrities',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
              Card(
                //13
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(0, 255, 76, 1),
                child: InkWell(
                  splashColor: Colors.grey.withAlpha(50),
                  onTap: () {
                    sentToQuiz(
                        'https://opentdb.com/api.php?amount=10&category=27&type=multiple');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/koala.png'))),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3, left: 8, top: 2),
                          child: Text(
                            'Animals',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        )),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber[600],
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ));
              },
            ),
            ListTile(
              title: Text('My quizes'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyQuiz(),
                    ));
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Auth().signout();
              },
            )
          ],
        ),
      ),
    );
  }
}
