import 'package:Gossips/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  String _email, _password;
  bool barControl = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[600],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Get-Set-Go...',
                style: TextStyle(
                  fontFamily: 'PermanentMarker',
                  fontSize: 23.0,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.5, 2.5),
                      color: Colors.black,
                      blurRadius: 3.0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: CircleAvatar(
                  radius: 67,
                  backgroundColor: Colors.deepOrange[300],
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: TextFormField(
                  controller: emailControl,
                  onChanged: (text) {
                    this._email = text;
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "Email-ID",
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, left: 40, right: 40),
                child: TextFormField(
                  controller: passwordControl,
                  onChanged: (value) => this._password = value,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        _email = emailControl.text;
                        _password = passwordControl.text;
                        if (_email.isEmpty || _password.isEmpty) {
                          print('Empty');
                          AlertDialog alertDialog = AlertDialog(
                            title: Text('Quizrr...'),
                            content:
                                Text('Please fill all the details correctly.'),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      barControl = false;
                                    });
                                  },
                                  child: Text('Ok'))
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alertDialog;
                            },
                          );
                        } else {
                          Auth().signin(_email, _password);
                        }

                        setState(() {
                          barControl = true;
                        });
                      },
                      color: Colors.deepOrange[400],
                      child: Text(
                        'Sign-In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _email = emailControl.text;
                        if (_email.isEmpty == false) {
                          Auth().reset(_email);
                          AlertDialog alertDialog = AlertDialog(
                            title: Text('Quizrr...'),
                            content: Text('Reset main sent!'),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      barControl = false;
                                    });
                                  },
                                  child: Text('Ok'))
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alertDialog;
                            },
                          );
                        } else {
                          AlertDialog alertDialog = AlertDialog(
                            title: Text('Quizrr...'),
                            content: Text('Please fill the email.'),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      barControl = false;
                                    });
                                  },
                                  child: Text('Ok'))
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alertDialog;
                            },
                          );
                        }

                        setState(() {
                          barControl = true;
                        });
                      },
                      color: Colors.deepOrange[400],
                      child: Text(
                        'Reset :(',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 2),
                child: Center(
                  child: Visibility(
                    visible: barControl,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: FlatButton(
                  onPressed: () async {
                    const url = 'http://13.58.200.33:4532/signup';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not open $url';
                    }
                  },
                  child: Text('New User? Register Here'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
