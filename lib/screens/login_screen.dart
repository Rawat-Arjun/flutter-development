import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/main.dart';
import 'package:mynotes/screens/verifyEmail_screen.dart';
import '../constants/routes.dart';
import '../dialogBoxes/showErrorDialog.dart';
import '../Services/firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login Page',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          children: [
            TextField(
              controller: email,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: password,
              obscureText: true,
              enableSuggestions: false,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await Firebase.initializeApp(
                    options: DefaultFirebaseOptions.currentPlatform,
                  );

                  final user = FirebaseAuth.instance.currentUser;

                  final email_ = email.text;
                  final password_ = password.text;

                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email_,
                      password: password_,
                    );
                    final user = FirebaseAuth.instance.currentUser;
                    if (user?.emailVerified ?? false) {
                      showErrorDialog(
                        context,
                        'Verified User',
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const notesView(),
                        ),
                      );
                    } else if (user?.emailVerified ?? true) {
                      showErrorDialog(
                        context,
                        'Not Verified User',
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const verifyEmail(),
                        ),
                      );
                    }

                    if (email_.isEmpty) {
                      '* Please enter email here';
                    } else if (password_.isEmpty) {
                      '* Please enter password here';
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      showErrorDialog(
                        context,
                        'User not found',
                      );
                    } else if (e.code == 'wrong-password') {
                      showErrorDialog(
                        context,
                        'Wrong password',
                      );
                    }
                  }
                },
                child: const Text(
                  'Login',
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamed(Routes.registerRoute);
              },
              child: const Text(
                'Back To Register',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
