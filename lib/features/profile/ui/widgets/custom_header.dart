import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final double height;
  const CustomHeader({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ClipPath(
      clipper: BezierClipper(),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, size.height);
    path.cubicTo(
        0, size.height * 0.1,
        size.width * 0.9, size.height,
        size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }
}