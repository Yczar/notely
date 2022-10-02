import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String email;
  final String fullName;
  final String password;

  const User({
    this.id,
    required this.email,
    required this.fullName,
    required this.password,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? fullName,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [id, email, fullName];
}
