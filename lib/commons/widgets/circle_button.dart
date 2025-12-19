import 'package:flutter/material.dart';

Widget circleButton({
  required double backgroundSize,
  required String backgroundPath,
  required double iconSize,
  required String iconPath,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: backgroundSize,
      height: backgroundSize,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: backgroundSize,
              width: backgroundSize,
              decoration: BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(backgroundPath),
            ),
          ),
          Positioned(
            top: (backgroundSize - iconSize) / 2,
            left: (backgroundSize - iconSize) / 2,
            child: SizedBox(height: iconSize, width: iconSize, child: Image.asset(iconPath)),
          ),
        ],
      ),
    ),
  );
}
