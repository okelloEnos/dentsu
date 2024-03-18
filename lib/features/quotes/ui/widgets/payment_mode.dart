import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';

class PaymentMode extends StatelessWidget {
  final String paymentMode;
  final String imagePath;
  final String selectedPaymentMode;
  final Function(String) onSelect;
  const PaymentMode({Key? key,
    required this.paymentMode,
    required this.imagePath,
    required this.onSelect,
    required this.selectedPaymentMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
                value: paymentMode,
                groupValue: selectedPaymentMode,
                onChanged: (value) => onSelect(paymentMode),
            activeColor: theme.colorScheme.secondary,
            ),
            CustomTextWidget(text: paymentMode,
            fontSize: 14,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.tertiary,
            ),
          ],
        ),
        Image.asset("assets/images/$imagePath", fit: BoxFit.contain, height: 50, width: 100)
      ],
    );
  }
}
