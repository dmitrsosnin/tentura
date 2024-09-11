import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:vector_graphics/vector_graphics.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/settings/ui/bloc/settings_cubit.dart';

@RoutePage()
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );

  final _settingsCubit = GetIt.I<SettingsCubit>();

  final _pageController = PageController(keepPage: false);

  late final _theme = Theme.of(context);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          minimum: paddingMediumA,
          child: Column(
            children: [
              // Skip Button
              Padding(
                padding: paddingSmallV,
                child: Row(
                  children: [
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () => _settingsCubit.setIntroEnabled(false),
                      child: const Text('Skip'),
                    ),
                  ],
                ),
              ),

              // Page Body
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  itemBuilder: (context, i) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image
                      SvgPicture(
                        AssetBytesLoader(_pages[i].asset),
                      ),

                      // Position Indicator
                      DotsIndicator(
                        position: i,
                        dotsCount: _pages.length,
                        decorator: DotsDecorator(
                          size: const Size(20, 8),
                          activeSize: const Size(50, 8),
                          activeColor: _theme.colorScheme.tertiary,
                          color: _theme.disabledColor,
                          activeShape: _shape,
                          shape: _shape,
                        ),
                      ),

                      // Title
                      Padding(
                        padding: paddingMediumA,
                        child: Text(
                          _pages[i].title,
                          textAlign: TextAlign.center,
                          style: _theme.textTheme.displayMedium,
                        ),
                      ),

                      // Text
                      Padding(
                        padding: paddingMediumA,
                        child: Text(
                          _pages[i].text,
                          textAlign: TextAlign.center,
                          style: _theme.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Continue Button
              Padding(
                padding: paddingMediumV,
                child: FilledButton(
                  onPressed: () {
                    (_pageController.page?.toInt() ?? 0) >= _pages.length - 1
                        ? _settingsCubit.setIntroEnabled(false)
                        : _pageController.nextPage(
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 250),
                          );
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      );

  static const _pages = [
    // Page 1
    (
      asset: 'assets/intro/1.svg.vec',
      title: 'Discover the initiatives of others',
      text: 'Check the feed with information about new '
          'initiatives or activities from community members',
    ),
    // Page 2
    (
      asset: 'assets/intro/2.svg.vec',
      title: 'Collaborate and Connect',
      text: 'Establish relationships with new acquaintances by helping '
          'to implement their projects and supporting initiatives',
    ),
    // Page 3
    (
      asset: 'assets/intro/3.svg.vec',
      title: 'Create and Share your initiatives',
      text: 'Tell the community about your initiative '
          'or project and get support',
    ),
    // Page 4
    (
      asset: 'assets/intro/4.svg.vec',
      title: 'Manage your social field',
      text: 'Rank projects and supporting '
          'the most interesting initiatives of community members',
    ),
    // Page 5
    (
      asset: 'assets/intro/5.svg.vec',
      title: 'Investigate your connections',
      text: 'A transparent and understandable system to establish '
          'what connects you with each member of the community',
    ),
  ];
}
