import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_chat_app_mentor_academy/core/constants/backend_points.dart';
import 'package:mini_chat_app_mentor_academy/core/errors/exception.dart';
import 'package:mini_chat_app_mentor_academy/core/errors/failures.dart';
import 'package:mini_chat_app_mentor_academy/core/services/database_service.dart';
import 'package:mini_chat_app_mentor_academy/core/services/firebase_auth_service.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/model/auth_model.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserModel(
        email: email,
        name: name,
        uId: user.uid,
        phoneNumber: phone,
        about: "Hello i,m zyad Course",
        image: "",
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        lastActivated: DateTime.now().millisecondsSinceEpoch.toString(),
        puchToken: "",
        online: false,
        myUsers: [],
      );
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      deleteUser(user);
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword ${e.toString()}'); // da el exception el r2ysy
      return Left(
        ServerFailure(
          'An error occurred.',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService
          .deleteUser(); // 3mlna kda 3lasahan lw 3mlna account mn 8er el byanat ttsgl hn3ml ll account delete
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uId: user.uid);
      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      return Left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log('Exception in AuthRepoImpl.signInUserWithEmailAndPassword ${e.toString()}'); // da el exception el r2ysy
      return Left(
        ServerFailure('An error occurred.'),
      );
    }
  }

  @override
  Future addUserData({required UserModel user}) async {
    await databaseService.addData(
      data: user.toMap(),
      path: BackendPoints.addUserData,
      documentId: user.uId,
    );
    }

  @override
  Future<UserModel> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      path: BackendPoints.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }
}
