import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/common/text_fields.dart';
import 'package:skillharvest/core/util/constants/constant.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.isNewUser});

  final bool isNewUser;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.blueColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.isNewUser ? 'Add Profile' : 'Edit Profile',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 120,
        backgroundColor: Pallete.blueColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Gap(12),
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Pallete.blueColor, shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        foregroundImage: AssetImage(
                          AppImage.placeholderImage,
                        ),
                        radius: 70,
                        backgroundColor: Color.fromARGB(255, 71, 60, 60),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 0,
                    child: Container(
                      color: Pallete.whiteColor,
                      child: const Icon(
                        size: 38,
                        Icons.photo_camera_rounded,
                        color: Pallete.blueColor,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(12),
              AppTextField(
                label: 'Display Name',
                hint: 'Enter Name',
                textController: nameController,
              ),
              const Gap(12),
              AppTextField(
                label: 'Nickname',
                hint: 'Enter Nickname',
                textController: nickNameController,
              ),
              const Gap(12),
              AppTextField(
                label: 'Phone Number',
                hint: 'Enter Number',
                textController: phoneNumberController,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Continue',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
