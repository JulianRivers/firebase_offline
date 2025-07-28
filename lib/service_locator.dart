import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_offline/features/auth/data/datasources/firebase_auth_datasource_impl.dart';
import 'package:firebase_offline/features/auth/data/datasources/remote_auth_datasources.dart';
import 'package:firebase_offline/features/auth/data/repositories/users_repository_impl.dart';
import 'package:firebase_offline/features/auth/domain/repositories/users_repository.dart';
import 'package:firebase_offline/features/auth/domain/usecases/create_user_with_email_and_password.dart';
import 'package:firebase_offline/features/auth/domain/usecases/sign_in_with_anonymous.dart';
import 'package:firebase_offline/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:firebase_offline/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

GetIt getIt = GetIt.instance;

Future<void> serviceLocatorInit() async {
  //Firebase
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => GoogleSignIn.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  //Bloc
  getIt.registerFactory(() => AuthBloc(getIt(), getIt(), getIt(), getIt()));
  //Use Cases
  getIt.registerLazySingleton(() => SignInWithEmail(repository: getIt()));
  getIt.registerLazySingleton(() => SignInWithAnonymous(repository: getIt()));
  getIt.registerLazySingleton(
    () => CreateUserWithEmailAndPasswordUseCase(repository: getIt()),
  );
  //Repository
  getIt.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(remoteAuthDataSource: getIt()),
  );
  //Data Sources
  getIt.registerLazySingleton<RemoteAuthDataSource>(
    () => FirebaseAuthDatasourceImpl(
      auth: getIt(),
      googleSignIn: getIt(),
      db: getIt(),
    ),
  );
}
