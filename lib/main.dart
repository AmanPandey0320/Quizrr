import 'package:Gossips/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
          body: SplashScreen(
          seconds: 3,
          title: Text('Quizrr...',
          style: TextStyle(
            fontFamily: 'PermanentMarker',
            fontSize: 38.0,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(5,5),
                color: Colors.black,
                blurRadius: 3.0,
                ),
            ],
          ),
          ),
          backgroundColor: Colors.amber[600],
          loaderColor: Colors.white,
          navigateAfterSeconds:new AfterSplash() ,
        ),
      ),
    );
  }
  
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Auth().handleAuth();
  }
}
