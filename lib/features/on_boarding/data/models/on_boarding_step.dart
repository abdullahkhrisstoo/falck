// lib/core/models/onboarding_step.dart
class OnboardingStep {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingStep({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  // Factory method to create an OnboardingStep from JSON
  factory OnboardingStep.fromJson(Map<String, dynamic> json) {
    return OnboardingStep(
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }

  // Method to convert OnboardingStep to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image_url': imageUrl,
    };
  }
}
