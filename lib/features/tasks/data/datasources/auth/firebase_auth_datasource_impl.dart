import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/data/datasources/auth/remote_auth_datasources.dart';
import 'package:firebase_offline/features/tasks/data/models/user_model.dart';
import 'package:firebase_offline/features/tasks/domain/entities/user.dart'
    as app;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDatasourceImpl extends RemoteAuthDataSource {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  FirebaseAuthDatasourceImpl({required this.auth, required this.googleSignIn});

  @override
  Future<app.User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromUserCredential(userCredential);
    }
    //TODO handle custom errors
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
      throw AuthFailure(e.message!, e.stackTrace);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await googleSignIn.signOut();
      await auth.signOut();
    } catch (error) {
      debugPrint(error.toString());
      throw UnknowFailure("Error durante el cierre de sesión.");
    }
  }

  @override
  Future<app.User> signInAnonymous() async {
    try {
      final userCredential = await auth.signInAnonymously();
      return UserModel.fromUserCredential(userCredential);
    }
    //TODO handle custom errors
    on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          debugPrint("Anonymous auth hasn't been enabled for this project.");
        default:
          debugPrint("Unknown error.");
      }
      throw AuthFailure(e.message!, e.stackTrace);
    } catch (error) {
      debugPrint(error.toString());
      throw UnknowFailure(error.toString());
    }
  }

  @override
  Future<app.User> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromUserCredential(userCredential);
    }
    //TODO handle custom errors
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
      throw AuthFailure(e.message!, e.stackTrace);
    } catch (error) {
      debugPrint(error.toString());
      throw UnknowFailure(error.toString());
    }
  }

  @override
  Future<app.User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      if (googleUser == null) {
        //TODO hanlde error when user cancels flow
        throw UnimplementedError();
      }
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );
      return UserModel.fromUserCredential(userCredential);
    }
    //TODO handle custom errors
    on FirebaseAuthException catch (e) {
      throw AuthFailure(e.message!, e.stackTrace);
    } catch (error) {
      debugPrint(error.toString());
      throw UnknowFailure(error.toString());
    }
  }
}
