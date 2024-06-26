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
import 'package:skillharvest/features/home/screens/home.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key, required this.isNewUser});

  final bool isNewUser;

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  File? _pickedImageFile;

  bool _validate() {
    final nameValidator = Validator.validateText(_nameController.text, null);

    final phoneValidator =
        Validator.validatePhone(_phoneNumberController.text, null);
    if (nameValidator == null && phoneValidator == null) {
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_pickedImageFile == null && widget.isNewUser) {
      showSnackBar(context, 'Please select an image');
      return;
    }
    if (_validate()) {
      await ref.read(signUpProvider.notifier).addProfile(
            image: _pickedImageFile,
            displayName: _nameController.text,
            phoneNumber: _phoneNumberController.text,
            context: context,
          );
      if (context.mounted) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      }
      return;
    }
    if (context.mounted) {
      showSnackBar(context, 'PLEASE FILL IN VALID DETAILS');
    }
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
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isBusy = ref.watch(signUpProvider).isBusy;
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
              PhoneTextField(
                label: 'Phone Number',
                hint: 'Enter Number',
                textController: _phoneNumberController,
              ),
              const Spacer(),
              isBusy
                  ? const SizedBox(
                      height: 44,
                      width: 44,
                      child: CircularProgressIndicator(
                        color: Pallete.blueColor,
                      ),
                    )
                  : PrimaryButton(
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
