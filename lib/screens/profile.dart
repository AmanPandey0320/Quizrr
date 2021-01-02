import 'package:Gossips/services/auth.dart';
import 'package:Gossips/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _uid = Auth().getUID();
  var user = Map();
  List<String> avatarOptions = [
    'boy0.png',
    'boy1.png',
    'boy2.png',
    'boy3.png',
    'boy4.png',
    'boy5.png',
    'boy6.png',
    'boy7.png',
    'boy8.png',
    'boy9.png',
    'boy10.png',
    'boy11.png',
    'girl0.png',
    'girl1.png',
    'girl2.png',
    'girl3.png',
    'girl4.png',
    'girl5.png',
    'girl6.png',
    'girl7.png',
    'girl8.png',
    'girl9.png',
    'girl10.png',
    'girl11.png'
  ];
  String avatar = 'user.png',
      name = 'User',
      about = 'Hello!',
      email = 'user@example.com';

  TextEditingController nameControl = new TextEditingController();
  TextEditingController aboutControl = new TextEditingController();

  getProfile() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(_uid)
        .get()
        .then((value) => {
              this.user = Map.from(value.data()),
              avatar = user['av'],
              name = user['nm'],
              email = user['em'],
              about = user['ab']
            });

    setState(() {});
  }

  @override
  void initState() {
    getProfile();
    super.initState();
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
      body: Container(
        margin: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.blueAccent[600],
                    child: InkWell(
                      onTap: () {
                        AlertDialog alertDialog = new AlertDialog(
                          title: Center(
                            child: Text(
                              'Thou profile',
                              style: TextStyle(
                                fontFamily: 'PermanentMarker',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: [
                                  Image.asset('assets/$avatar'),
                                  TextFormField(
                                    controller: nameControl,
                                    decoration: InputDecoration(
                                        labelText: 'New profile name'),
                                  ),
                                  TextFormField(
                                    controller: aboutControl,
                                    decoration:
                                        InputDecoration(labelText: 'New about'),
                                  ),
                                  FlatButton(
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                        fontFamily: 'Righteous',
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (nameControl.text.length != 0)
                                        name = nameControl.text;
                                      if (aboutControl.text.length != 0)
                                        about = aboutControl.text;
                                      await Database().createUserProfile(
                                          avatar, name, email, about);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    color: Colors.amber[600],
                                  ),
                                ],
                              ),
                              height: 440,
                            ),
                          ),
                        );
                        showDialog(
                          context: context,
                          builder: (context) => alertDialog,
                        );
                      }, //on tap
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/$avatar'),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.only(top: 8, left: 8),
                          child: Text(
                            '$name',
                            style: TextStyle(
                                fontFamily: 'Righteous', fontSize: 16),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.only(top: 8, left: 8),
                          child: Text('$about')),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 32),
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red[800],
                            radius: 32,
                            child: InkWell(
                              onTap: () async {
                                avatar = avatarOptions[3*index];
                                await Database().createUserProfile(
                                    avatar, name, email, about);
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    'assets/${avatarOptions[3*index]}'),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red[800],
                            radius: 32,
                            child: InkWell(
                              onTap: () async {
                                avatar = avatarOptions[3*index + 1];
                                await Database().createUserProfile(
                                    avatar, name, email, about);
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    'assets/${avatarOptions[3*index + 1]}'),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red[800],
                            radius: 32,
                            child: InkWell(
                              onTap: () async {
                                avatar = avatarOptions[3*index + 2];
                                await Database().createUserProfile(
                                    avatar, name, email, about);
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    'assets/${avatarOptions[3*index + 2]}'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
