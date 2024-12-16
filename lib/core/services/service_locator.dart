import 'package:get_it/get_it.dart';
import 'package:mini_chat_app_mentor_academy/core/services/database_service.dart';
import 'package:mini_chat_app_mentor_academy/core/services/firebase_auth_service.dart';
import 'package:mini_chat_app_mentor_academy/core/services/firesotre_service.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/repos/auth_repo.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FiresotreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
