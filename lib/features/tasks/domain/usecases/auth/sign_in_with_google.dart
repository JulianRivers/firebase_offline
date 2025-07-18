import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/users_repository.dart';

class SignInWithGoogle {
  final UsersRepository repository;

  SignInWithGoogle({required this.repository});

  Future<Either<AppFailure, void>> call(String email, String password) {
    return repository.signInWithGoogle();
  }
}
