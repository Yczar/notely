import 'package:flutter/material.dart';
import 'package:notely/app/ui/screens/get_started_screen.dart';

class Notely extends StatelessWidget {
  const Notely({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const GetStartedScreen(),
    );
  }
}
