import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/constants/constant.dart';

class PhoneLogin extends StatelessWidget {
  const PhoneLogin({super.key});

  @override
  Widget build(BuildContext context) {
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
            'Enter your phone number',
            style: TextStyle(
              color: Pallete.greyText,
            ),
          ),
          const Gap(20),
          TextFormField(),
          // Container(
          //   width: double.infinity,
          //   height: 40,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(14),
          //       border: Border.all(color: Pallete.greyText)),
          //   child: Text('jdf'),
          // ),
        ],
      ),
    );
  }
}

// Column(
//           children: [
//             const Row(
//               children: [
//                 Icon(
//                   Icons.arrow_back_ios_new,
//                   color: Pallete.blackColor,
//                 ),
//                 Text(
//                   'Continue with Phone',
//                   style: TextStyle(
//                     color: Pallete.blackColor,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//             const Gap(30),
//             SvgPicture.asset(AppImage.conWithPhone)
//           ],
//         ),