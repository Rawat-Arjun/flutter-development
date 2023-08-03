import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late final TextEditingController userName;
  late final TextEditingController number;
  late final TextEditingController email;
  late final TextEditingController password;

  @override
  void initState() {
    userName =TextEditingController();
    number =TextEditingController();
    email =TextEditingController();
    password =TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userName.dispose();
    number.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register Page'),
      ),
      body:Column(
        children: [
          TextField(controller: userName,
          enableSuggestions: false,
          decoration: const InputDecoration(hintText: 'User Name'),),

          TextField(controller: number,
          keyboardType: TextInputType.datetime,
          decoration: const InputDecoration(hintText: 'Contact No.'),),
          
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
                child: const Text('Sign Up')
              ),
            
          ),
          Center(child: TextButton(onPressed: (){
             Navigator.of(context).pushNamedAndRemoveUntil('/login/', (route) => false,);
              },
              child: const Text("Go to Login Page")),
              )
        ],
      ),
    );
  }
}