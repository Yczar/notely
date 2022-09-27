import 'package:flutter/material.dart';
import 'package:notely/app/ui/screens/create_a_note_screen.dart';
import 'package:notely/app/ui/widgets/notely_form_field.dart';

import '../../../src/utils/margins/y_margin.dart';
import '../widgets/notely_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 34.0,
          ),
          child: Column(
            children: [
              const YMargin(16),
              Expanded(
                child: Column(
                  children: const [
                    Center(
                      child: Text(
                        'Notely',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    YMargin(62),
                    Text(
                      'Create a free account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF403B36),
                      ),
                    ),
                    YMargin(5),
                    Text(
                      'Join Notely for free. Create and share unlimited notes with your friends.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF595550),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    YMargin(52),
                    NotelyFormField(
                      label: 'Full Name',
                      hint: 'Salman Khan',
                    ),
                    YMargin(21),
                    NotelyFormField(
                      label: 'Email Address',
                      hint: 'mesalmanwap@gmail.com',
                    ),
                    YMargin(21),
                    NotelyFormField(
                      label: 'Password',
                      hint: '############',
                    ),
                    YMargin(21),
                  ],
                ),
              ),
              NotelyButton(
                text: 'Create Account',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CreateANoteScreen(),
                    ),
                  );
                },
              ),
              const YMargin(20),
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFD9614C),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
