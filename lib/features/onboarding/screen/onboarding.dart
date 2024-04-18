import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:skillharvest/data/onboard_data.dart';
import 'package:skillharvest/features/onboarding/widgets/auth_buttons.dart';
import 'package:skillharvest/features/onboarding/widgets/onboarding_content.dart';
import 'package:skillharvest/features/onboarding/widgets/scroll_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    setState(() {});
                    _pageController.animateToPage(
                      3,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                    );
                  },
                  child: _pageIndex == 2
                      ? const SizedBox(
                          height: 16,
                        )
                      : const SizedBox(
                          height: 16,
                          child: Text('Skip'),
                        ),
                ),
              ),
              const Gap(12),
              SizedBox(
                height: 470,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: onboardList.length,
                  itemBuilder: (context, index) => OnboardingContent(
                    showButton: onboardList[index].showButton,
                    image: onboardList[index].image,
                    title: onboardList[index].title,
                    description: onboardList[index].description,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(
                    onboardList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: ScrollIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          _pageIndex == 2 ? const AuthButtons() : const SizedBox(height: 50),
        ],
      ),
    );
  }
}
