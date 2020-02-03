import 'package:flutter/material.dart';

class Alert {
  static displayAlertPlain(
    BuildContext context, {
    String title = '',
    String content = '',
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      },
    );
  }
}
