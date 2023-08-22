import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/dialogBoxes/showErrorDialog.dart';
import 'package:mynotes/screens/verifyEmail_screen.dart';
import '../Services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: email,
                enableSuggestions: false,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: password,
                obscureText: true,
                enableSuggestions: false,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final form = formkey.currentState!;

                    if (form.validate()) {
                      await Firebase.initializeApp(
                        options: DefaultFirebaseOptions.currentPlatform,
                      );
                    }

                    final email_ = email.text;
                    final password_ = password.text;

                    if (email_.isEmpty) {
                      '* Please enter email here';
                      return null;
                    } else if (password_.isEmpty) {
                      '* Please enter password here';
                      return null;
                    }

                    try {
                      final userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email_, password: password_);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const verifyEmail(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        showErrorDialog(
                          context,
                          'email already in use',
                        );
                      } else if (e.code == 'invalid-email') {
                        showErrorDialog(
                          context,
                          'Invalid Email',
                        );
                      } else if (e.code == 'weak-password') {
                        showErrorDialog(
                          context,
                          'Weak Password',
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Sign Up',
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.loginRoute,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Already an account!,  Login ',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
