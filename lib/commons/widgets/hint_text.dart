import 'package:flutter/cupertino.dart';

import '../../core/colors.dart';

Widget hintText(String text) {
  return Text.rich(
    TextSpan(
      text: text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral_400),
      children: [
        TextSpan(
          text: '*',
          style: TextStyle(color: AppColors.red_500, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
