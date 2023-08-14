// import 'dart:js';
// import 'package:flutter/material.dart';

// class exitApp extends StatefulWidget {
//   const exitApp({super.key});

//   @override
//   State<exitApp> createState() => _exitAppState();
// }

// class _exitAppState extends State<exitApp> {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope( onWillPop:() {
//       return showExitDialog(context);
//     },);
//     Scaffold();
//   }
// }
    
//   Future<bool> showExitDialog () async{
//   return await showDialog(
//     context: context,
//       builder: (context) => AlertDialog(
//           title: const Text('Exit App'),
//           content: const Text(
//               'Are you sure you want to exit from app ? '),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(false);
//                 },
//                 child: const Text('No')),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(true);
//                 },
//                 child: const Text('Yes')),
        
//           ],
          
//         )
//       );return false;
//     }
