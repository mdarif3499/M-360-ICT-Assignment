import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog{
  BuildContext context;
  CustomAlertDialog(this.context);
  void showMyAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Alert'),
        content: Text('This is an alert dialog.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // dismiss dialog
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Do something
              Navigator.pop(context); // dismiss dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
