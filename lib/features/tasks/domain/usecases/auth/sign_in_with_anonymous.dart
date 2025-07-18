import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/users_repository.dart';

class SignInWithAnonymous {
  final UsersRepository repository;

  SignInWithAnonymous({required this.repository});

  Future<Either<AppFailure, void>> call() {
    return repository.signInWithAnonymous();
  }
}
