class OnboardingModel {
  final int index;
  final String title;
  final String description;
  final String image;

  OnboardingModel({
    required this.index,
    required this.title,
    required this.description,
    required this.image,
  });
  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      index: 0,
      title: 'World’s Safest And Largest Digital Notebook',
      description:
          'Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.',
      image: 'assets/images/onboarding_image.png',
    ),
    OnboardingModel(
      index: 1,
      title: 'World’s Safest And Largest Digital Notebook',
      description:
          'Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.',
      image: 'assets/images/onboarding_image.png',
    ),
    OnboardingModel(
      index: 2,
      title: 'World’s Safest And Largest Digital Notebook',
      description:
          'Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.',
      image: 'assets/images/onboarding_image.png',
    ),
  ];
}
