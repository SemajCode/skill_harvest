import 'package:flutter/material.dart';

class PopularityTag extends StatelessWidget {
  const PopularityTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const ShapeBorderClipper(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 4, 16, 4),
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4),
          ),
        ),
        child: const Text('BESTSELLER'),
      ),
    );
  }
}
