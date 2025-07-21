import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/auth/data/datasources/remote_auth_datasources.dart';
import 'package:firebase_offline/features/auth/domain/entities/user.dart';
import 'package:firebase_offline/features/auth/domain/repositories/users_repository.dart';

class UsersRepositoryImpl extends UsersRepository {
  final RemoteAuthDataSource remoteAuthDataSource;

  UsersRepositoryImpl({required this.remoteAuthDataSource});

  @override
  Future<Either<AppFailure, User>> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final User resp = await remoteAuthDataSource
          .createUserWithEmailAndPassword(email, password);
      return Right(resp);
    } on AuthFailure {
      return Left(AuthFailure("error de autenticación"));
    }
  }

  @override
  Future<Either<AppFailure, void>> logout() async {
    try {
      await remoteAuthDataSource.logout();
      return Right(null);
    } on AuthFailure {
      return Left(AuthFailure("error de autenticación"));
    }
  }

  @override
  Future<Either<AppFailure, User>> signInWithAnonymous() async {
    try {
      final User resp = await remoteAuthDataSource.signInWithAnonymous();
      return Right(resp);
    } on AuthFailure {
      return Left(AuthFailure("error de autenticación"));
    }
  }

  @override
  Future<Either<AppFailure, User>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final User resp = await remoteAuthDataSource.signInWithEmail(
        email,
        password,
      );
      return Right(resp);
    } on AuthFailure {
      return Left(AuthFailure("error de autenticación"));
    }
  }

  @override
  Future<Either<AppFailure, User>> signInWithGoogle() async {
    try {
      final User resp = await remoteAuthDataSource.signInWithGoogle();
      return Right(resp);
    } on AuthFailure {
      return Left(AuthFailure("error de autenticación"));
    }
  }
}
