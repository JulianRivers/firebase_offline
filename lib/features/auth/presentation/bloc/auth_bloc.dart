import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/auth/domain/entities/user.dart';
import 'package:firebase_offline/features/auth/domain/usecases/create_user_with_email_and_password.dart';
import 'package:firebase_offline/features/auth/domain/usecases/sign_in_with_anonymous.dart';
import 'package:firebase_offline/features/auth/domain/usecases/sign_in_with_email.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmail _signInWithEmail;
  final SignInWithAnonymous _signInWithAnonymous;
  final CreateUserWithEmailAndPasswordUseCase
  _createUserWithEmailAndPasswordUseCase;
  final SignInWithEmail _signInWithGoogle;

  AuthBloc(
    this._signInWithEmail,
    this._signInWithAnonymous,
    this._createUserWithEmailAndPasswordUseCase,
    this._signInWithGoogle,
  ) : super(AuthInitial()) {
    on<OnCreateUserWithEmailAndPassword>((event, emit) async {
      emit(AuthLoading());
      final resp = await _createUserWithEmailAndPasswordUseCase(
        event.email,
        event.password,
      );
      resp.fold(
        (f) => emit(AuthFailure(failure: f)),
        (u) => emit(AuthSuccess(u)),
      );
    });
    on<OnSignWithEmail>((event, emit) {
      // TODO: implement event handler
    });
    on<OnSignWithGoogle>((event, emit) {
      // TODO: implement event handler
    });
    on<OnSingWithAnonymous>((event, emit) {
      // TODO: implement event handler
    });
  }
}
