import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/constants/constant.dart';

class UserPaymentCard extends StatelessWidget {
  const UserPaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 6,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Pallete.blueColor,
            Pallete.purpleColor,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //card chip
                  SvgPicture.asset(
                    AppImage.cardChip,
                    height: 24,
                  ),

                  //logo
                  SvgPicture.asset(
                    AppImage.masterCard,
                    height: 24,
                  ),
                ],
              ),
              const Gap(8),
              //Card Number
              const Text(
                '**** **** **** 2132',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Card Name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card Holder Name',
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        'John Doe',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  //Expiry Date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expiry Date',
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        '07/25',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  //Delete Icon
                  Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                    size: 28,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
