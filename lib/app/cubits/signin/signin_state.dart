import 'package:equatable/equatable.dart';

abstract class SigninState extends Equatable {}

class SigninInitial extends SigninState {
  @override
  List<Object?> get props => [];
}

class SigninLoading extends SigninState {
  @override
  List<Object?> get props => [];
}

class SigninLoaded extends SigninState {
  @override
  List<Object?> get props => [];
}

class SigninError extends SigninState {
  final String message;

  SigninError(this.message);

  @override
  List<Object?> get props => [message];
}
