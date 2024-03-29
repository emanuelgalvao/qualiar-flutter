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
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(title, style: Theme.of(context).textTheme.labelLarge,),
        content: Text(description, style: Theme.of(context).textTheme.labelMedium,),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'OK',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      );
    },
  );
}
