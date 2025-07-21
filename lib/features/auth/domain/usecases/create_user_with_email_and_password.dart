import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/auth/domain/repositories/users_repository.dart';

class CreateUserWithEmailAndPasswordUseCase {
  final UsersRepository repository;

  CreateUserWithEmailAndPasswordUseCase({required this.repository});

  Future<Either<AppFailure, void>> call(String email, String password) {
    return repository.createUserWithEmailAndPassword(email, password);
  }
}
