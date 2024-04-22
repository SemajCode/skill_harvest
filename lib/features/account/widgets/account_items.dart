import 'package:flutter/material.dart';

class AccounItems extends StatelessWidget {
  const AccounItems({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.visibility_off,
          size: 16,
        ),
      ),
    );
  }
}
