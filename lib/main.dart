import 'package:authpractice/firebase_options.dart';
import 'package:authpractice/google_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirebaseInitializer(),
    );
  }
}

class FirebaseInitializer extends StatefulWidget {
  @override
  State<FirebaseInitializer> createState() => _FirebaseInitializerState();
}

class _FirebaseInitializerState extends State<FirebaseInitializer> {
  bool isInitialized = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      setState(() {
        isInitialized = true;
      });
      print('Firebase initialized successfully!');
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
      print('Firebase initialization failed: $errorMessage');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized && errorMessage == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return GoogleWidget();
  }
}

