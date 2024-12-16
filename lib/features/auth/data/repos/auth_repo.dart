import 'package:dartz/dartz.dart';
import 'package:mini_chat_app_mentor_academy/core/errors/failures.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/model/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword(
      String email, String password, String name, String phone);
  Future<Either<Failure, UserModel>> signInUserWithEmailAndPassword(
      String email, String password);
  Future addUserData(
      {required UserModel
          user}); 
  Future<UserModel> getUserData({required String uId});
}
