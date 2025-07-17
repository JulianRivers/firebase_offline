import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/users_repository.dart';

class LogoutUseCase {
  final UsersRepository repository;

  LogoutUseCase({required this.repository});

  Future<Either<AppFailure, void>> call() {
    return repository.logout();
  }
}
