import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAdaptiveSelector({
  required BuildContext context,
  Function(int)? onSelectedItemChanged,
  required List<Widget> children,
}) {
  if (Platform.isIOS) {
      _showCupertinoPicker(
        context: context,
        onSelectedItemChanged: onSelectedItemChanged!,
        children: children,
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            children: children,
          );
        },
      );
    }
}

void _showCupertinoPicker({
    required BuildContext context,
    required Function(int) onSelectedItemChanged,
    required List<Widget> children,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          width: double.infinity,
          height: 300,
          child: CupertinoPicker(
            itemExtent: 30,
            backgroundColor: Colors.white,
            scrollController: FixedExtentScrollController(),
            onSelectedItemChanged: onSelectedItemChanged,
            children: children,
          ),
        );
      },
    );
  }