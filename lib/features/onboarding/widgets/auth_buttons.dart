import 'package:flutter/material.dart';
import 'package:skillharvest/Theme/pallete.dart';
import 'package:skillharvest/features/auth/screens/login.dart';
import 'package:skillharvest/features/auth/screens/signup.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Signup(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 50),
              backgroundColor: Pallete.blueColor,
              foregroundColor: Pallete.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text('Sign up'),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(150, 50),
              backgroundColor: Pallete.whiteColor,
              foregroundColor: Pallete.blueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              side: const BorderSide(color: Pallete.blueColor),
            ),
            child: const Text('Log in'),
          )
        ],
      ),
    );
  }
}
