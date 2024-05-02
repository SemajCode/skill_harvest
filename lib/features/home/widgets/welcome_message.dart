import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/features/auth/provider/auth_provider.dart';

class WelcomeMessage extends ConsumerWidget {
  const WelcomeMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.read(firebaseServiceProvider).getUserProfile();
    return FutureBuilder(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Pallete.blueColor,
            );
          } else {
            final String username = snapshot.data!.displayName;
            final String image = snapshot.data!.imagePath;
            return Container(
              color: Pallete.blueColor,
              height: 118,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, $username',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const Text(
                          'Let\'s start learning',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(firebaseServiceProvider).signOut();
                      },
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: FadeInImage(
                          image: NetworkImage(image),
                          placeholder:
                              const AssetImage(AppImage.placeholderImage),
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
