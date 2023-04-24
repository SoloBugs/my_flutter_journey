import 'package:flutter/material.dart';


class GradientBackground extends StatelessWidget {
  
  final List<Color> colors;
  
  const GradientBackground({
    super.key, 
    this.colors = const [
      Colors.transparent,
      Colors.black87
    ]
  });

  @override
  Widget build(BuildContext context) {
    return  Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors
            )
          ),
        )
      );
  }
}