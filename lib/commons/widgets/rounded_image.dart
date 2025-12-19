import 'package:flutter/material.dart';

Widget roundedImage({required double size, required String assetPath}) {
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(shape: BoxShape.circle),
    clipBehavior: Clip.hardEdge,
    child: Image.asset(assetPath),
  );
}
