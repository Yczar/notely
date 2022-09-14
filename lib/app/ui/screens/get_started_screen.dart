import 'package:flutter/material.dart';
import 'package:notely/app/model/onboarding_model.dart';
import 'package:notely/app/ui/screens/create_account_screen.dart';
import 'package:notely/src/utils/margins/y_margin.dart';

import '../widgets/notely_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({
    super.key,
  });

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  late ValueNotifier<int> _currentPageNotifier;

  @override
  void initState() {
    super.initState();

    /// A way to notify the widget that the value has changed.
    _currentPageNotifier = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onboardingList = OnboardingModel.onboardingList;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 34.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const YMargin(16),
              const Center(
                child: Text(
                  'Notely',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const YMargin(118),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    _currentPageNotifier.value = value;
                  },
                  itemCount: onboardingList.length,
                  itemBuilder: (_, index) {
                    final onboardingItem = onboardingList[index];
                    return Column(
                      children: [
                        Image.asset(
                          onboardingItem.image,
                          height: 197,
                        ),
                        const YMargin(28),
                        Text(
                          onboardingItem.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF403B36),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const YMargin(12),
                        Text(
                          onboardingItem.description,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF595550),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _currentPageNotifier,
                builder: (_, int currentValue, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: onboardingList.map(
                      (onboarding) {
                        final selected = onboarding.index == currentValue;
                        return Container(
                          height: 10,
                          width: 10,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? theme.colorScheme.secondary
                                : theme.colorScheme.secondary.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
              const YMargin(55),
              NotelyButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CreateAccountScreen(),
                    ),
                  );
                },
              ),
              const YMargin(20),
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFD9614C),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
