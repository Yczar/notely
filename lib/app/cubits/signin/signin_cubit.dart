import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  Future<void> signin() async {
    emit(SigninLoading());
    try {
      final userCredentialResult =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '',
        password: '',
      );
      if (userCredentialResult.user != null) {
        emit(
          SigninLoaded(),
        );
      } else {
        emit(
          SigninError(
            'An error occurred',
          ),
        );
      }
    } on FirebaseAuthException catch (error) {
      log(error.toString());
      emit(
        SigninError(
          error.message ?? 'An error occurred',
        ),
      );
    } catch (error) {
      log(error.toString());
      emit(
        SigninError(
          error.toString(),
        ),
      );
    }
  }
}
