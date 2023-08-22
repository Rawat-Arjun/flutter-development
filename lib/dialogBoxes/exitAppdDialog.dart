import 'package:flutter/material.dart';

class exitAppDialog extends StatelessWidget {
  const exitAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: const Text(
        'This is a child',
      ),
      onWillPop: () async {
        await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Exit App',
              ),
              content: const Text(
                'Are you sure you want to exit the app? ',
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
                    Navigator.of(context).pop(true);
                  },
                  child: const Text(
                    'Yes',
                  ),
                ),
              ],
            );
          },
        );
        return false;
      },
    );
  }
}
