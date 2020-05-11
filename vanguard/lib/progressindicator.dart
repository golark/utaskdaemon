import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

Widget progressIndicator() {
  return  Container(
    child: SizedBox(
      child: CircularProgressIndicator(),
      width: 10,
      height: 10,
    ),
  );
}