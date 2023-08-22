import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';

class verifyEmail extends StatefulWidget {
  const verifyEmail({super.key});

  @override
  State<verifyEmail> createState() => _verifyEmailState();
}

class _verifyEmailState extends State<verifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Email Verification',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text(
            'Verify your email user !',
          ),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user!.sendEmailVerification();
              print(user);
            },
            child: const Text(
              'Email Verify',
            ),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed(Routes.registerRoute);
            },
            child: const Text(
              'Sign Out',
            ),
          ),
        ],
      ),
    );
  }
}
