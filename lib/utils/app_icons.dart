import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static final isIos = Platform.isIOS;

  // Bottom Navigation
  static final home = isIos ? CupertinoIcons.home : Icons.home;
  static final myLocations = isIos ? CupertinoIcons.map : Icons.map;
  static final about = isIos ? CupertinoIcons.info : Icons.info;

  // Home
  static final go = isIos ? CupertinoIcons.chevron_right : Icons.arrow_forward;

  // Locations
  static final add = isIos ? CupertinoIcons.add : Icons.add;
  static final favorite = isIos ? CupertinoIcons.star_fill : Icons.star;
  static final delete = isIos ? CupertinoIcons.delete : Icons.delete;
  static final save = isIos ? CupertinoIcons.check_mark : Icons.save;
}