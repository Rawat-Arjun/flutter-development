import 'dart:core';
import 'package:flutter/material.dart';
import 'package:mynotes/login_screen.dart';
import 'package:mynotes/registration_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter App',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const notes_view(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView()
    },
  ));
}

enum dropdownMenu { profile, settings, logout }

class notes_view extends StatefulWidget {
  const notes_view({super.key});

  @override
  State<notes_view> createState() => notes_viewState();
}

class notes_viewState extends State<notes_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawer(
        child: ListView(
          children: const [
            Column(
              children: [
                ListTile(
                  title:  Text('Home'),
                  leading: Icon(Icons.home),
                ),
                ListTile(
                  title:  Text('Remainder'),
                  leading: Icon(Icons.report_gmailerrorred_rounded),
                ),ListTile(
                  title:  Text('Settings'),
                  leading: Icon(Icons.settings),
                ),ListTile(
                  title:  Text('Notifications'),
                  leading: Icon(Icons.notification_add),
                ),ListTile(
                  title:  Text('Privacy Policy'),
                  leading: Icon(Icons.privacy_tip),
                ),ListTile(
                  title:  Text('Log Out'),
                  leading: Icon(Icons.logout),
                )

              ],
            )
          ],
        ),
      ),
        appBar: AppBar(
          
      title: const Text('My Notes'),
      actions: [
        PopupMenuButton<dropdownMenu>(
          onSelected: (value) async {
            if (value==value){
              final shouldLogout = await showLogoutBox(context);
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem<dropdownMenu>(
                value: dropdownMenu.profile,
                child: Text('Profile'),
              ),
              PopupMenuItem<dropdownMenu>(
                value: dropdownMenu.settings,
                child: Text('settings'),
              ),
              PopupMenuItem<dropdownMenu>(
                value: dropdownMenu.logout,
                child: Text('Logout'),
              )
            ];
          }, 
        )
      ],
    ));
  }
}

Future<bool> showLogoutBox (BuildContext context){
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to logout from your account ? '),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop(false);
          }, child: const Text('No')),
          TextButton(onPressed: (){
            Navigator.of(context).popAndPushNamed('/login/');
          }, child: const Text('Yes')),
        ],
      );
    }
  ).then((value) => value ?? false);
}

