import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/util/helper.dart';
import 'package:skillharvest/features/payment/widgets/user_payment_card.dart';

class PaymentCards extends StatelessWidget {
  const PaymentCards({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        centerTitle: false,
        title: const Text(
          'Cards',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Add Card',
                    style: TextStyle(
                      color: Pallete.blueColor,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: pageHeight(context) * 0.75,
                    minHeight: 50,
                  ),
                  child: ListView(
                    children: [
                      UserPaymentCard(),
                      UserPaymentCard(),
                    ],
                  ),
                ),
                Gap(4),
              ],
            ),
            PrimaryButton(
              text: 'Make Payment',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
