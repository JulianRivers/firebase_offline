import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/auth/domain/entities/user.dart';

abstract class UsersRepository {
  Future<Either<AppFailure, User>> createUserWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<AppFailure, User>> signInWithEmail(
    String emial,
    String password,
  );
  Future<Either<AppFailure, User>> signInWithGoogle();
  Future<Either<AppFailure, User>> signInWithAnonymous();
  Future<Either<AppFailure, void>> logout();
}
