
import 'package:firebase_offline/features/auth/domain/entities/user.dart';

abstract class RemoteAuthDataSource {
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<User> signInWithEmail(String email, String password);
  Future<User> signInWithGoogle();
  Future<User> signInWithAnonymous();
  Future<void> logout();
}
