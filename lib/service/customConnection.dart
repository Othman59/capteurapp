import 'package:firebase_auth/firebase_auth.dart';

class CustomConnection {
  static Future<String> login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "OK";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  }