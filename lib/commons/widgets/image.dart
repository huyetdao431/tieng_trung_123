import 'package:flutter/material.dart';

Widget image({required double size, required String assetPath}) {
  return SizedBox(height: size, width: size, child: Image.asset(assetPath));
}
