import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final Widget child;
  final String? assetName;
  const BackgroundImageWidget({super.key, required this.child, this.assetName});

  @override
  Widget build(BuildContext context) {
  var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        image: DecorationImage(
          opacity: 0.3,
          image: AssetImage(assetName ?? "assets/images/background_pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
