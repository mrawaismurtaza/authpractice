import 'package:authpractice/google_service.dart';
import 'package:flutter/material.dart';

class GoogleWidget extends StatefulWidget {
  const GoogleWidget({super.key});

  @override
  State<GoogleWidget> createState() => _GoogleWidgetState();
}

class _GoogleWidgetState extends State<GoogleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            minimumSize: const Size(220, 50),
            elevation: 2,
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          icon: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
            height: 24,
            width: 24,
          ),
          label: const Text(
            'Sign in with Google',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            GoogleService googleService = GoogleService();
            googleService.signInWithGoogle().then((value) {
              if (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Google Sign-In Successful!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Google Sign-In Failed!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: $error'),
                  duration: const Duration(seconds: 2),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}