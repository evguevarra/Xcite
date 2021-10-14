//import 'package:event_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

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

  Future<void> signUp(String email, String password, String fullname) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore(fullname: fullname)})
        .catchError((e) {
      Fluttertoast.showToast(
        msg: e!.message,
        toastLength: Toast.LENGTH_SHORT,
      );
    });
  }

  void postDetailsToFirestore({required String fullname}) async {
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
  }
}
