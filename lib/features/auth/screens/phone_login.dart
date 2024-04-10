import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/features/auth/widget/reg_success_modal.dart';

class PhoneLogin extends StatelessWidget {
  const PhoneLogin({super.key});

  @override
  Widget build(BuildContext context) {
    void login() {
      showDialog(
        context: context,
        builder: (context) => const RegSuccesModal(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.offWhiteColor,
        title: const Text(
          'Continue with Phone',
          style: TextStyle(
            color: Pallete.blackColor,
            fontSize: 18,
          ),
        ),
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Pallete.blackColor,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Pallete.offWhiteColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: SvgPicture.asset(AppImage.conWithPhone),
            ),
          ),
          const Gap(20),
          const Text(
            'Enter your Phone Number',
            style: TextStyle(
              color: Pallete.greyText,
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Pallete.greyText),
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: SizedBox(
                      width: 162,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(115, 48),
                      backgroundColor: Pallete.blueColor,
                      foregroundColor: Pallete.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child: const Text('Continue'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
