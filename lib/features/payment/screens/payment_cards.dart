// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/constants/constant.dart';
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
            Expanded(
              child: ListView(
                children: [
                  UserPaymentCard(),
                  UserPaymentCard(),
                  UserPaymentCard(),
                ],
              ),
            ),
            Gap(4),
            PrimaryButton(text: 'Add New Card', onTap: () {})
          ],
        ),
      ),
    );
  }
}
