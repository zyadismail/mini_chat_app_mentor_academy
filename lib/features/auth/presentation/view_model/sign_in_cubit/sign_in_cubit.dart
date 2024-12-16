import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/model/auth_model.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> sigin({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepo.signInUserWithEmailAndPassword(
      email,
      password,
    );
 result.fold(
      (failure) => emit(SignInError(message: failure.message)),
      (userModel) => emit(SignInSuccess(userModel: userModel)),
    );  }
}
