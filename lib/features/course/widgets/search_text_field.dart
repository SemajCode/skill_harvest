import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/course/widgets/filter_bottom_sheet.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Find Course',
          hintStyle: const TextStyle(color: Pallete.greyText),
          prefixIcon: const Icon(Icons.search, color: Pallete.greyText),
          suffixIcon: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const FilterBottomSheet(),
              );
            },
            child: const Icon(Icons.tune, color: Pallete.greyText),
          ),
          fillColor: Pallete.offWhiteColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
