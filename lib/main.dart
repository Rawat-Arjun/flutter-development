import 'package:app1/views/login_view.dart';
import 'package:app1/views/register_view.dart';
import 'package:flutter/material.dart';
import 'dart:core';
//import 'package:flutter/rendering.dart';



void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter App',
    theme: ThemeData(
      primarySwatch:Colors.blue   
      ), 
      home: const LoginView(),
      routes: {
        '/login/':(context) => const LoginView(),
        '/register/':(context) => const RegisterView()
      },
    )
  );
}

class HomePage extends StatelessWidget {
const HomePage({super.key});


@override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Stack(
         children: [
           Container(
            child: const Text('English'),
            padding: const EdgeInsets.only(left: 150,top: 40 ),
                ),
         
          Container(
            child: Image.asset('images/instagram.jpg'),
           padding: const EdgeInsets.symmetric(
            vertical: 100,
            horizontal: 50
           ),
              ),
            
         ],
         
       ),
       
        );
  }
}