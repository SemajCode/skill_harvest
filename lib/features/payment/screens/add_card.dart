import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/common/text_fields.dart';
import 'package:skillharvest/features/payment/widgets/user_payment_card.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController textEditingController = TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

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
            Column(
              children: [
                const UserPaymentCard(),
                const Gap(20),
                AppTextField(
                  textController: textEditingController,
                  label: 'Card Holder Name',
                  hint: '',
                ),
                const Gap(12),
                PasswordTextField(
                  passwordController: passwordEditingController,
                  label: 'Card Number',
                  hint: '',
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: AppTextField(
                        textController: textEditingController,
                        label: 'Expiry Date',
                        hint: '',
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: AppTextField(
                        textController: textEditingController,
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
