import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/screens/verifyEmail_screen.dart';
import '../firebase_options.dart';

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
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: email,
            enableSuggestions: false,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            decoration: const InputDecoration(
                hintText: 'Email Address', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: password,
            obscureText: true,
            enableSuggestions: false,
            decoration: const InputDecoration(
                hintText: 'Password', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                );
                final user = FirebaseAuth.instance.currentUser;
                print(user);

                if (user?.emailVerified ?? false) {
                  print('Verified user! ');
                } else {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const verifyEmail()));
                  print('Not Verified user! ');
                }

                final email_ = email.text;
                final password_ = password.text;
                try {
                  final UserCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email_, password: password_);
                  print(UserCredential);
                } on FirebaseAuthException catch (e) {
                  print(e.runtimeType);

                  if (e.code == 'user-not-found') {
                    print(e.runtimeType);
                    print('User not found !');
                    // ignore: use_build_context_synchronously
                    return showDialog(
                        context: context,
                        builder: ((context) {
                          return Container(
                            child: AlertDialog(
                              title: const Text(
                                  'You are not Registered yet, Register now !'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            registerRoute, (route) => false);
                                  },
                                  child: const Text('Ok'),
                                )
                              ],
                            ),
                          );
                        }));
                  } else if (e.code == 'wrong-password') {
                    print(e.runtimeType);
                    print('Entered wrong Password !');
                    // ignore: use_build_context_synchronously
                    return showDialog(
                        context: context,
                        builder: ((context) {
                          return Container(
                            child: AlertDialog(
                              title: const Text(
                                  'You entered wrong password. Try again !'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            loginRoute, (route) => false);
                                  },
                                  child: const Text('Ok'),
                                )
                              ],
                            ),
                          );
                        }));
                  }
                  validator:
                  (email) {
                    if (email!.isEmpty) {
                      return '* Please enter email here';
                    } else if (!EmailValidator.validate(email)) {
                      return '* Enter a Valid Email Address';
                    } else {
                      return null;
                    }
                  };

                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //   notesRoute,
                  //   (route) => false,
                  // );
                }
              },
              child: const Text('Login'),
              onHover: (value) => 'Login Now',
            ),
          ),
        ]),
      ),
    );
  }
}
