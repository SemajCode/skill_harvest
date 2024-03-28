import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/features/onboarding/onboarding.dart';

class RegSuccesModal extends StatelessWidget {
  const RegSuccesModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Onboarding(),
        ),
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          height: 320,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Pallete.whiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Pallete.blueColor,
                size: 80,
              ),
              const Gap(20),
              const Text(
                'Success',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Pallete.blackColor,
                  decoration: TextDecoration.none,
                ),
              ),
              const Gap(20),
              const Text(
                'Congratulations, you have \n completed your registration.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Pallete.greyText,
                    fontSize: 14,
                    decoration: TextDecoration.none),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: PrimaryButton(
                  text: 'Done',
                  onTap: onTap,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
