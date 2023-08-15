import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/screens/verifyEmail_screen.dart';
import '../firebase_options.dart';
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
                validator: (email) {
                  if (email!.isEmpty) {
                    return '* Please enter email here';
                  } else if (!EmailValidator.validate(email)) {
                    return '* Enter a Valid Email Address';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    labelText: 'Email Address', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: password,
                obscureText: true,
                enableSuggestions: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '* Please enter password here';
                  } else if (value.length < 6) {
                    return 'Password should contains atleast 6 letters';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      final form = formkey.currentState!;
                      if (form.validate()) {
                        final email_ = email.text;
                        final password_ = password.text;
                      }

                      await Firebase.initializeApp(
                        options: DefaultFirebaseOptions.currentPlatform,
                      );
                      final email_ = email.text;
                      final password_ = password.text;
                      try {
                        final UserCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email_, password: password_);

                        print(UserCredential);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print(e.runtimeType);
                          print('Weak passwowrd');
                          // ignore: use_build_context_synchronously
                          return showDialog(
                              context: context,
                              builder: ((context) {
                                return Container(
                                  child: AlertDialog(
                                    title: const Text(
                                        'You entered weak password. Try some hard one !'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  registerRoute,
                                                  (route) => false);
                                        },
                                        child: const Text('Ok'),
                                      )
                                    ],
                                  ),
                                );
                              }));
                        } else if (e.code == 'email-already-in-use') {
                          print(
                              'you have already an account, You can simply login !');
                          // ignore: use_build_context_synchronously
                          return showDialog(
                              context: context,
                              builder: ((context) {
                                return Container(
                                  child: AlertDialog(
                                    title: const Text(
                                        '''You are already an user of our App.
click "Login Now"-> to go to login " 
click "Stay"-> to stay here '''),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  loginRoute, (route) => false);
                                        },
                                        child: const Text('Login Now'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  registerRoute,
                                                  (route) => false);
                                        },
                                        child: const Text('Stay'),
                                      )
                                    ],
                                  ),
                                );
                              }));
                        }
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => verifyEmail(),
                        ),
                      );
                    },
                    child: const Text('Sign Up')),
              ),
              Container(
                child: TextButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (route) => false,
                    );
                  },
                  child: const Text('Already an account!,  Login '),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
