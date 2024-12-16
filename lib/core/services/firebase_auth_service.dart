import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_chat_app_mentor_academy/core/errors/exception.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FireBaseAuthService.createUserWithEmailAndPassword ${e.toString()} and code is ${e.code}'); // da el exception el r2ysy
      if (e.code == 'weak-password') {
        throw CustomException(
          message: 'password is very weak',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'email is already in use');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'check the network connection',
        );
      } else {
        throw CustomException(
            message: 'An error has occurred, please try again.');
      }
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword ${e.toString()}'); // da el exception el r2ysy
      throw CustomException(
          message: 'An error has occurred, please try again.');
    }
  }

  Future<User> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FireBaseAuthService.signInUserWithEmailAndPassword ${e.toString()} and code is ${e.code}'); // da el exception el r2ysy
      if (e.code == 'wrong-password') {
        throw CustomException(message: 'password is very weak');
      } else if (e.code == 'user-not-found') {
        throw CustomException(message: 'Account does not exist');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'No internet connection');
      } else {
        throw CustomException(
            message: 'An error has occurred, please try again.');
      }
    } catch (e) {
      log('Exception in SignInUserWithEmailAndPassword ${e.toString()}'); // da el exception el r2ysy
      throw CustomException(
        message: 'An error has occurred, please try again.',
      );
    }
  }
}
