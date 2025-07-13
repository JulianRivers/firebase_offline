abstract class AppFailure {
  final String message;
  final StackTrace? stackTrace;

  const AppFailure(this.message, [this.stackTrace]);

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkFailure extends AppFailure {
  const NetworkFailure(super.message, [super.stackTrace]);
}

class AuthFailure extends AppFailure {
  const AuthFailure(super.message, [super.stackTrace]);
}

class FirestoreFailure extends AppFailure {
  const FirestoreFailure(super.message, [super.stackTrace]);
}

class FunctionFailure extends AppFailure {
  const FunctionFailure(super.message, [super.stackTrace]);
}

class UnknowFailure extends AppFailure {
  const UnknowFailure(super.message, [super.stackTrace]);
}
