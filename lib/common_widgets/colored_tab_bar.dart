import 'package:flutter/material.dart';

class ColoredTabBar extends ColoredBox implements PreferredSizeWidget {
  const ColoredTabBar({Key? key, required this.color, required this.tabBar}) : super(key: key, color: color, child: tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;
}