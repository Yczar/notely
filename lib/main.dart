import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notely/notely.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const Notely(),
  );
}
/// Widget -> What is being rendered
/// 
/// Render Object -> Responsible for sizes and layout used in painting your 
/// widget to your screen.
/// Element -> 
/// 