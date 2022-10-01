import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/app/cubits/auth/auth_cubit.dart';
import 'package:notely/app/cubits/auth/auth_state.dart';
import 'package:notely/app/cubits/signup/signup_cubit.dart';
import 'package:notely/app/ui/screens/create_a_note_screen.dart';
import 'package:notely/app/ui/screens/get_started_screen.dart';

class Notely extends StatelessWidget {
  const Notely({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(),
        ),
        BlocProvider(
          create: (_) => SignupCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Notely',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: const Color(0xFFF8EEE2),
          scaffoldBackgroundColor: const Color(0xFFF8EEE2),
          fontFamily: 'Nunito',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: const Color(0xFFD9614C),
          ),
        ),
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (_, state) {
            log('state: $state');
            if (state is AuthAuthenticated) {
              return const CreateANoteScreen();
            } else {
              return const GetStartedScreen();
            }
          },
        ),
      ),
    );
  }
}
