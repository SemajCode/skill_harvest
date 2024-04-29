import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/common/buttons.dart';
import 'package:skillharvest/core/common/text_fields.dart';
import 'package:skillharvest/core/util/helpers/helper_fuctions.dart';
import 'package:skillharvest/core/util/validators/validator.dart';
import 'package:skillharvest/features/account/widgets/user_image_picker.dart';
import 'package:skillharvest/features/auth/controllers/signup_controller.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key, required this.isNewUser});

  final bool isNewUser;

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  File? _pickedImageFile;

  bool _validate() {
    final nameValidator = Validator.validateText(_nameController.text, null);
    final nickNameValidator =
        Validator.validateText(_nickNameController.text, null);
    final phoneValidator =
        Validator.validatePhone(_phoneNumberController.text, null);
    if (nameValidator == null &&
        nickNameValidator == null &&
        phoneValidator == null) {
      return true;
    }
    return false;
  }

  void _submit() {
    if (_validate()) {
      ref.read(signUpProvider.notifier).addProfile(
            _pickedImageFile,
            _nameController.text,
            _nickNameController.text,
            _phoneNumberController.text,
          );
      return;
    }
    showSnackBar(context, 'PLEASE FILL IN VALID DETAILS');
  }

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
  }

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
              GestureDetector(
                onTap: _pickImage,
                child: UserImagePicker(
                  pickedImageFile: _pickedImageFile,
                  pickImage: _pickImage,
                ),
              ),
              const Gap(12),
              AppTextField(
                label: 'Display Name',
                hint: 'Enter Name',
                textController: _nameController,
              ),
              const Gap(12),
              AppTextField(
                label: 'Nickname',
                hint: 'Enter Nickname',
                textController: _nickNameController,
              ),
              const Gap(12),
              PhoneTextField(
                label: 'Phone Number',
                hint: 'Enter Number',
                textController: _phoneNumberController,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Continue',
                onTap: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
