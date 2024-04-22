import 'package:flutter/material.dart';

import 'custom_button.dart';

class SelectButtonSectionWidget extends StatelessWidget {
  final bool isLoading;
  final String title;
  final String message;
  final String buttonText;
  final Function() onTap;

  const SelectButtonSectionWidget(
      {super.key,
      required this.isLoading,
      required this.title,
      required this.message,
      required this.buttonText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 10),
        isLoading
            ? CircularProgressIndicator.adaptive()
            : Text(
                message,
                style: Theme.of(context).textTheme.labelMedium,
              ),
        const SizedBox(height: 20),
        CustomButton(
          label: buttonText,
          onPressed: onTap,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
