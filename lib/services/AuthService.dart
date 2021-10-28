import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/models/UserModel.dart';
import 'package:go_vaccine/themes.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      _db.collection('users').doc(googleSignInAccount.email).get().then((value) {
        UserModel userModel = UserModel(fullName: googleSignInAccount.displayName, email: googleSignInAccount.email, photoUrl: googleSignInAccount.photoUrl);
        _db.collection('users').doc(googleSignInAccount.email).set(userModel.toJson());
      });
      return googleSignInAccount.email;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(BuildContext context, UserModel userModel) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(email: userModel.email, password: userModel.password!);
    saveUserToDB(context, userModel);
    return user;
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> saveUserToDB(BuildContext context, UserModel userModel) async {
    _db.collection('users').doc(userModel.email).get().then((value) {
      if (value.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Email sudah terdaftar!'
            )
          ),
        );
      } else {
        FirebaseFirestore.instance.collection('users').doc(userModel.email).set(
            userModel.toJson());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColor,
            content: Text(
              'Berhasil Daftar'
            )
          ),
        );
        Navigator.pop(context);
      }
    });
  }
}