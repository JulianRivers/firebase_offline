part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnCreateUserWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  const OnCreateUserWithEmailAndPassword(this.email, this.password);
}

class OnSignWithEmail extends AuthEvent {}

class OnSingWithAnonymous extends AuthEvent {}

class OnSignWithGoogle extends AuthEvent {}
