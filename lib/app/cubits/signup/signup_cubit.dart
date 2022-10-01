import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/app/cubits/signup/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signup(
    String email,
    String password,
  ) async {
    emit(SignupLoading());
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        log('Successfully signed up');
        emit(
          SignupLoaded(
            user: user,
          ),
        );
      } else {
        emit(
          const SignupError(
            'An error occurred',
          ),
        );
      }
    } on FirebaseAuthException catch (error) {
      log(' ${error.message}');
      emit(
        SignupError(
          error.message ?? 'An error occurred',
        ),
      );
    } catch (error) {
      log(error.toString());
      emit(
        SignupError(
          error.toString(),
        ),
      );
    }
  }
}

/// Firestore
