import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController email;
  late final TextEditingController password;

  @override
  void initState() {
    email =TextEditingController();
    password =TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Page'),
      ),
      body:Column(
        children: [
          
          TextField(controller: email,
          enableSuggestions: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: 'Email Address'),),
          
          TextField(controller: password,obscureText: true,
          enableSuggestions: false,
          //autocorrect: false,
          decoration: const InputDecoration(hintText: 'Password'),),
          Center(
              child: TextButton(
                  onPressed: () async{}, 
                  child: const Text('Login'),
                  onHover: (value) => 'Login Now',
              ),
          ),
            
            Center(child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/register/', (route) => false,);
              },
            child: const Text('Not registered yet? Register Now !')),
          ),
        ],
      ),
    );
  }  
}