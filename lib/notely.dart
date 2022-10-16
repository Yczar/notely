import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/app/cubits/auth/auth_cubit.dart';
import 'package:notely/app/cubits/auth/auth_state.dart';
import 'package:notely/app/cubits/signup/signup_cubit.dart';
import 'package:notely/app/providers/notes_provider.dart';
import 'package:notely/app/ui/screens/notes_screen.dart';
import 'package:notely/app/ui/screens/get_started_screen.dart';
import 'package:provider/provider.dart';

class Notely extends StatelessWidget {
  const Notely({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (_) => NotesProvider(),
        )
      ],
      child: MultiBlocProvider(
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
                return const NoteScreen();
              } else {
                return const GetStartedScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
