// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:notely/app/model/user.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupLoading extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupLoaded extends SignupState {
  const SignupLoaded({
    required this.user,
  });
  final User user;
  @override
  List<Object?> get props => [user];
}

class SignupError extends SignupState {
  final String message;

  const SignupError(this.message);

  @override
  List<Object?> get props => [message];
}
