//import 'package:event_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/core/user.dart';
import 'package:event_app/screens/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              Fluttertoast.showToast(
                msg: "Login Successful",
                toastLength: Toast.LENGTH_SHORT,
              )
            })
        .catchError((e) {
      Fluttertoast.showToast(
        msg: e!.message,
        toastLength: Toast.LENGTH_SHORT,
      );
    });
  }

  Future<void> signUp(String email, String password, String fullname,
      BuildContext context) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) =>
            {postDetailsToFirestore(fullname: fullname, context: context)})
        .catchError((e) {
      Fluttertoast.showToast(
        msg: e!.message,
        toastLength: Toast.LENGTH_SHORT,
      );
    });
  }

  void postDetailsToFirestore(
      {required String fullname, required BuildContext context}) async {
    //Firestore call and user model
    //sending values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _firebaseAuth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = fullname;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(
      msg: "Account Created Successfully!",
      toastLength: Toast.LENGTH_SHORT,
    );
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }
}
