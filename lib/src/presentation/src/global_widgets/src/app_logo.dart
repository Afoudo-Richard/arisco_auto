// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:arisco_auto/arisco_auto.dart';

class AppLogo extends StatelessWidget {
  AppLogo({
    Key? key,
    this.width,
  }) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo.png",
      width: width ?? 30.w,
    );
  }
}
