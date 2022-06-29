class OnboardingContent {
  String backgroundImagePath;
  String title;
  String description;
  String heroImg;

  OnboardingContent(
      {required this.backgroundImagePath,
      required this.title,
      required this.description,
      required this.heroImg});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      backgroundImagePath: 'assets/images/background.png',
      heroImg: 'assets/images/Group 1967.png',
      title: 'Lorem ipsum',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et neque quis massa pretium fringilla nec pulvinar dolor. Fusce fermentum venenatis felis non pulvinar'),
  OnboardingContent(
      backgroundImagePath: 'assets/images/background.png',
      heroImg: 'assets/images/EV 3.png',
      title: 'Lorem ipsum',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et neque quis massa pretium fringilla nec pulvinar dolor. Fusce fermentum venenatis felis non pulvinar'),
  OnboardingContent(
      backgroundImagePath: 'assets/images/background.png',
      heroImg: 'assets/images/EV 2.png',
      title: 'Lorem ipsum',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et neque quis massa pretium fringilla nec pulvinar dolor. Fusce fermentum venenatis felis non pulvinar'),
];
