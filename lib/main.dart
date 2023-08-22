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
        Routes.notesRoute: (context) => const notesView(),
        Routes.loginRoute: (context) => const LoginView(),
        Routes.registerRoute: (context) => const RegisterView(),
        Routes.verifyEmailRoute: (context) => const verifyEmail(),
      },
    ),
  );
}

enum DropDownMenu { logout }

class notesView extends StatefulWidget {
  const notesView({super.key});

  @override
  State<notesView> createState() => notesViewState();
}

class notesViewState extends State<notesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Notes',
        ),
        actions: [
          PopupMenuButton<DropDownMenu>(
            onSelected: (value) async {
              if (value == value) {
                await showLogoutBox(context);
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<DropDownMenu>(
                  value: DropDownMenu.logout,
                  child: Text(
                    'Logout',
                  ),
                )
              ];
            },
          )
        ],
      ),
    );
  }
}

Future<bool> showLogoutBox(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Log Out',
          ),
          content: const Text(
            'Are you sure you want to logout from your account ? ',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'No',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(Routes.loginRoute);
              },
              child: const Text(
                'Yes',
              ),
            ),
          ],
        );
      }).then((value) => value ?? false);
}
