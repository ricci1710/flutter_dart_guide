import 'package:flutter/material.dart';

class GradientAppBar extends AppBar {
  final List<Color> gradientColors;

  GradientAppBar({super.key, required Widget title, required this.gradientColors})
      : super(
          title: title,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradientColors),
            ),
          ),
        );
}
