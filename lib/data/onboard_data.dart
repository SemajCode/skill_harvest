import 'package:skillharvest/core/util/constants/constant.dart';
import 'package:skillharvest/models/onboard.dart';

List<Onboard> onboardList = [
  Onboard(
      image: AppImage.onboarding1,
      title: 'Numerous free trial courses',
      description: 'Free courses for you to find your way to learning',
      showButton: false),
  Onboard(
      showButton: false,
      image: AppImage.onboarding2,
      title: 'Quick and easy  learning',
      description: 'Free courses for you to find your way to learning'),
  Onboard(
      showButton: true,
      image: AppImage.onboarding3,
      title: 'Create your own study plan',
      description:
          'Easy and fast learning at any time to help you improve various skills')
];
