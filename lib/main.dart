import 'dart:core';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/screens/login_screen.dart';
import 'package:mynotes/screens/registration_screen.dart';
import 'package:mynotes/screens/verifyEmail_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RegisterView(),
      routes: {
        notesRoute: (context) => const notes_view(),
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        verifyEmailRoute: (context) => const verifyEmail(),
      },
    ),
  );
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
        // drawer:  Drawer(
        //   child: ListView(
        //     children: const [
        //       Column(
        //         children: [
        //           ListTile(
        //             title:  Text('Home'),
        //             leading: Icon(Icons.home),
        //           ),
        //           ListTile(
        //             title:  Text('Remainder'),
        //             leading: Icon(Icons.report_gmailerrorred_rounded),
        //           ),ListTile(
        //             title:  Text('Settings'),
        //             leading: Icon(Icons.settings),
        //           ),ListTile(
        //             title:  Text('Notifications'),
        //             leading: Icon(Icons.notification_add),
        //           ),ListTile(
        //             title:  Text('Privacy Policy'),
        //             leading: Icon(Icons.privacy_tip),
        //           ),ListTile(
        //             title:  Text('Log Out'),
        //             leading: Icon(Icons.logout),
        //           )

        //         ],
        //       )
        //     ],
        //   ),
        // ),
        appBar: AppBar(
      centerTitle: true,
      title: const Text('My Notes'),
      actions: [
        PopupMenuButton<dropdownMenu>(
          onSelected: (value) async {
            if (value == value) {
              await showLogoutBox(context);
            }
          },
          itemBuilder: (context) {
            return const [
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

Future<bool> showLogoutBox(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text(
              'Are you sure you want to logout from your account ? '),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(loginRoute);
                },
                child: const Text('Yes')),
          ],
        );
      }).then((value) => value ?? false);
}
