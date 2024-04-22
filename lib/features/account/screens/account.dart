import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/features/account/widgets/account_items.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        title: const Text(
          'Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SvgPicture.asset(
            AppImage.avatarSvg,
            height: 88,
          ),
          const AccounItems(title: 'Favorite'),
          const AccounItems(title: 'Edit Account'),
          const AccounItems(title: 'Settings and privacy'),
          const AccounItems(title: 'Help'),
        ],
      ),
    );
  }
}
