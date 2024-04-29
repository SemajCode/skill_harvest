import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/constants/constant.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({
    super.key,
    this.pickedImageFile,
    required this.pickImage,
  });

  final void Function() pickImage;
  final File? pickedImageFile;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Pallete.blueColor, shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              foregroundImage: widget.pickedImageFile == null
                  ? const AssetImage(
                      AppImage.placeholderImage,
                    )
                  : FileImage(widget.pickedImageFile!) as ImageProvider,
              radius: 70,
              backgroundColor: const Color.fromARGB(255, 71, 60, 60),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 9,
          child: Container(
            height: 22,
            width: 20,
            color: Pallete.whiteColor,
          ),
        ),
        const Positioned(
          bottom: 6,
          right: 0,
          child: Icon(
            size: 38,
            Icons.photo_camera_rounded,
            color: Pallete.blueColor,
          ),
        ),
      ],
    );
  }
}
