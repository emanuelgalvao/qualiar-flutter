import 'package:flutter/material.dart';

showAdaptativeDialog(
  BuildContext context,
  String title,
  String description,
) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog.adaptive(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'OK',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      );
    },
  );
}
