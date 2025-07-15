import '../../../domain/entities/user.dart';

abstract class RemoteAuthDataSource {
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<User> signInWithEmail(String emial, String password);
  Future<User> signInWithGoogle();
  Future<User> signInAnonymous();
  Future<void> logout();
}
