import 'package:flutter/material.dart';

void showQrDialog({required BuildContext context, required Widget qrWidget}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "QR Code",
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        alignment: Alignment.topRight,
        origin: const Offset(-60, 120),
        scale: curve,
        child: qrWidget,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}