import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_offline/features/tasks/domain/entities/user.dart';

class UserModel extends User {
  UserModel({super.email, super.id, super.createdAt, super.lastLogin});

  factory UserModel.fromJson(json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      createdAt: json['createdAt'].toIso8601String(),
      lastLogin: json['lastLogin'].toIso8601String(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "createdAt": createdAt,
      "lastLogin": lastLogin,
    };
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      createdAt: user.createdAt,
      lastLogin: user.lastLogin,
    );
  }

  factory UserModel.fromUserCredential(firebase_auth.UserCredential user) {
    return UserModel(id: user.user?.uid, email: user.user?.email);
  }
}
