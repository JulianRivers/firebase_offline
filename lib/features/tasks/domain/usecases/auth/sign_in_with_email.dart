import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/users_repository.dart';

class SignInWithEmail {
  final UsersRepository repository;

  SignInWithEmail({required this.repository});

  Future<Either<AppFailure, void>> call(String email, String password) {
    return repository.signInWithEmail(email, password);
  }
}
