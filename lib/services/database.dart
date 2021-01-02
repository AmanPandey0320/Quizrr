import 'package:Gossips/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  String uid = Auth().getUID();

  Future<bool> addquiztoDB(
      int score, int wrong, int correct, int skip, String json) async {
    bool status = false;
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .collection('quiz')
        .doc((DateTime.now().millisecondsSinceEpoch).toString())
        .set({
      'json': json,
      'score': score,
      'wrong': wrong,
      'correct': correct,
      'skip': skip,
      'time': DateTime.now().toString(),
    }).then((value) => status = true);

    return Future.value(status);
  }

  Stream<QuerySnapshot> get allQuiz {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .collection('quiz')
        .snapshots();
  }

  createUserProfile(
      String avatar, String name, String email, String about) async {
    await FirebaseFirestore.instance.collection('user').doc(uid).set({
      'av': avatar,
      'nm': name,
      'em': email,
      'ab': about,
    });
  }
}
