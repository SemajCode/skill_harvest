import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/common/text_fields.dart';
import 'package:skillharvest/features/payment/widgets/user_payment_card.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        centerTitle: false,
        title: const Text(
          'Add Card',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                UserPaymentCard(),
                Gap(20),
                AppTextField(
                  label: 'Card Holder Name',
                  hint: '',
                ),
                Gap(12),
                PasswordTextField(
                  label: 'Card Number',
                  hint: '',
                ),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: AppTextField(
                        label: 'Expiry Date',
                        hint: '',
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: AppTextField(
                        label: 'CVV',
                        hint: '',
                      ),
                    ),
                  ],
                )
              ],
            ),
            PrimaryButton(
              text: 'Add Card',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
