import 'package:flutter/material.dart';

class CurvedCard extends StatelessWidget {
  const CurvedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedTopClipper(),
      child: Container(
        width: 300.0,
        height: 200.0,
        child: Card(
          elevation: 5.0,
          shape: CustomCardShape(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Custom Shape Card',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'This is a custom shape card example in Flutter',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShapeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedTopClipper(),
      child: Container(
        width: 300.0,
        height: 200.0,
        child: Card(
          elevation: 5.0,
          shape: CustomCardShape(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Custom Shape Card',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'This is a custom shape card example in Flutter',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCardShape extends RoundedRectangleBorder {
  const CustomCardShape();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double radius = 16.0;

    Path path = Path()
      ..moveTo(rect.left + radius, rect.top)
      ..lineTo(rect.right - radius, rect.top)
      ..quadraticBezierTo(rect.right, rect.top, rect.right, rect.top + radius)
      ..lineTo(rect.right, rect.bottom - radius)
      ..quadraticBezierTo(
          rect.right, rect.bottom, rect.right - radius, rect.bottom)
      ..lineTo(rect.left + radius, rect.bottom)
      ..quadraticBezierTo(rect.left, rect.bottom, rect.left, rect.bottom - radius)
      ..lineTo(rect.left, rect.top + radius)
      ..quadraticBezierTo(rect.left, rect.top, rect.left + radius, rect.top);

    return path;
  }
}

class CurvedTopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedTopClipper(),
      child: Container(
        width: 300.0,
        height: 200.0,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Curved Top Card',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'This is a curved top card example in Flutter',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height) // Start from the bottom-left corner
      ..quadraticBezierTo(
          size.width / 2, size.height - 20, size.width, size.height) // Curved part
      ..lineTo(size.width, 0)
    ..quadraticBezierTo(
    size.width / 2, 20, 0, 0)
    ; // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}





