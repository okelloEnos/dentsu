import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary.withOpacity(0.38), shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios,
                color: theme.colorScheme.onPrimary,
              )),
            )),
      ),
    );
  }
}

class BackArrowDynamic extends StatelessWidget {
  final Color? backgroundColor;
  final Color? arrowColor;
  const BackArrowDynamic({Key? key, this.backgroundColor, this.arrowColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: backgroundColor ?? theme.colorScheme.onPrimary.withOpacity(0.38), shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: arrowColor ?? theme.colorScheme.onPrimary,
                  )),
            )),
      ),
    );
  }
}

class BackArrowWithoutCenter extends StatelessWidget {
  const BackArrowWithoutCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0, right: 6.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: theme.colorScheme.primary,
              ),
            )),
      ),
    );
  }
}
