import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/util/util_barrel.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({Key? key}) : super(key: key);

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  String selectedPaymentMode = "";
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: theme.colorScheme.secondary,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(text: "Premium Summary",
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: theme.colorScheme.tertiary,
                ),
                Image.asset("assets/images/info.png", fit: BoxFit.contain, height: 24, width: 24)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Divider(
                color: theme.colorScheme.tertiary.withOpacity(0.1),
                thickness: 1.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(
                    text: "Total",
fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                CustomTextWidget(
                    text: "KES ${thousandNumberFormat("131435")}",
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            PaymentMode(
              selectedPaymentMode: selectedPaymentMode,
                paymentMode: "M-PESA PayBill",
                imagePath: "mpesa.png",
                onSelect: (mode){
                setState(() {
                  selectedPaymentMode = mode;
                });
                }),
            PaymentMode(
                selectedPaymentMode: selectedPaymentMode,
                paymentMode: "Credit / Debit Card",
                imagePath: "visa_mastercard.png",
                onSelect: (mode){
                  setState(() {
                    selectedPaymentMode = mode;
                  });
                }),
            const SizedBox(height: 20.0,),
            Center(
              child: OutlinedButton(
                onPressed: (){},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: CustomTextWidget(text: "Buy Now",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
