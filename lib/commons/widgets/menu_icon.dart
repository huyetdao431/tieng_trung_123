import 'package:flutter/material.dart';

import '../../core/colors.dart';

class MenuItem {
  const MenuItem({required this.text, required this.asset, required this.code});

  final String text;
  final String asset;
  final String code;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [america, china, vietNam];

  static const america = MenuItem(text: 'America', asset: 'assets/icons/america.png', code: '+1');
  static const china = MenuItem(text: 'China', asset: 'assets/icons/china.png', code: '+86');
  static const vietNam = MenuItem(text: 'VietNam', asset: 'assets/icons/viet_nam.png', code: '+84');

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Image.asset(item.asset, width: 24, height: 24),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            item.text,
            style: TextStyle(color: AppColors.neutral_500, fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          item.code,
          style: TextStyle(color: AppColors.neutral_500, fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.america:
        break;
      case MenuItems.china:
        break;
      case MenuItems.vietNam:
        break;
    }
  }
}
