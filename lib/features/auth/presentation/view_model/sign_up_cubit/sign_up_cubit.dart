import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/model/auth_model.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> sigUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
      phone,
    );
    result.fold(
      (failure) => emit(SignUpError(message: failure.message)),
      (userModel) => emit(SignUpSuccess(userModel: userModel)),
    );
  }
}
