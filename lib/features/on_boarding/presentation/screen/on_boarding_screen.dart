import 'package:falack_app/features/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:falack_app/features/on_boarding/presentation/bloc/on_boarding_event.dart';
import 'package:falack_app/features/on_boarding/presentation/bloc/on_boarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  late OnboardingBloc _onboardingBloc;

  @override
  void initState() {
    super.initState();
    _onboardingBloc = BlocProvider.of<OnboardingBloc>(context);
    _onboardingBloc.add(GetOnboardingStepsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnBoardingState>(
        builder: (context, state) {
          if (state is OnBoardingLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is OnBoardingLoaded) {
            return Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: state.steps.length,
                  itemBuilder: (context, index) {
                    final step = state.steps[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              step.imageUrl), // Adjust the image loading
                          SizedBox(height: 20),
                          Text(
                            step.title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            step.description,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: state.steps.length,
                    effect: WormEffect(),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next screen
                      Navigator.pushReplacementNamed(
                          context, '/nextScreen'); // Adjust the route name
                    },
                    child: Icon(Icons.arrow_forward),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is OnBoardingError) {
            return Center(child: Text(state.message));
          }

          return Center(child: Text('Welcome to Onboarding'));
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
