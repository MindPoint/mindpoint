import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindpoint/components/atoms/Step/main.dart';
import 'package:mindpoint/components/atoms/Text/main.dart';
import 'package:mindpoint/components/molecules/Button/main.dart';
import 'package:mindpoint/styles/colors/main.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as notations;

class DSWelcomeStepData {
  final String title;
  final List<String> paragraphs;

  const DSWelcomeStepData({
    required this.title,
    required this.paragraphs,
  });
}

class DSWelcomeTemplate extends HookWidget {
  final void Function() onFinish;
  final List<DSWelcomeStepData> steps;

  const DSWelcomeTemplate({
    super.key,
    required this.steps,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final CarouselController buttonCarouselController =
        useMemoized(() => CarouselController(), []);

    void handleNextButtonTap() {
      buttonCarouselController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    void handleBackButtonTap() {
      buttonCarouselController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    /// Stores the index of the current page and triggers the update of
    /// all of the other components that depends on it
    final ValueNotifier<int> currentPage = useState<int>(0);

    final isLastCarouselPage = currentPage.value >= (steps.length - 1);

    /// Previous Button data
    const previousButtonIcon = Icons.arrow_back;
    final previousButtonVariation = currentPage.value == 0
        ? DSButtonKinds.disabled
        : DSButtonKinds.secondary;

    /// Forward Button data
    final forwardButtonIcon =
        isLastCarouselPage ? Icons.done : Icons.arrow_forward;
    final forwardButtonCallback =
        isLastCarouselPage ? onFinish : handleNextButtonTap;

    /// Builds all carrousel items that will be displayed on the carrousel
    final List<Widget> carrouselItems = steps.map((data) {
      return Builder(
        builder: (BuildContext context) {
          final title = DSText(
            data.title,
            kind: DSTextKinds.primary,
            wheight: DSTextWheights.bold,
            size: DSTextSizes.xg,
          );

          final paragraphs = data.paragraphs.map(
            (data) {
              return Container(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: DSText(
                  data,
                  kind: DSTextKinds.primary,
                  wheight: DSTextWheights.regular,
                  size: DSTextSizes.m,
                ),
              );
            },
          ).toList();

          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 120,
              bottom: 0,
              left: 16,
              right: 16,
            ),
            decoration: const BoxDecoration(color: DSColor.white),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                const SizedBox(
                  height: 4,
                ),
                ...paragraphs,
              ],
            ),
          );
        },
      );
    }).toList();

    final carrousel = CarouselSlider(
      items: carrouselItems,
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        autoPlay: false,
        enableInfiniteScroll: false,
        viewportFraction: 1,
        initialPage: 0,
        onPageChanged: (int index, CarouselPageChangedReason reason) =>
            currentPage.value = index,
        pageSnapping: true,
      ),
    );

    /// Creates and updates the small bullets at the bottom, that indicates
    /// the current step the user are in.
    final List<Widget> stepBullets = steps.asMap().entries.map((entry) {
      final index = entry.key;

      final currentBulletState = currentPage.value >= index
          ? DSStepBulletState.active
          : DSStepBulletState.inactive;

      return Container(
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 0,
          left: 0,
          right: 8,
        ),
        child: DSStepBullet(
          state: currentBulletState,
        ),
      );
    }).toList();

    return Column(
      children: [
        /// Wraps the carousel
        Expanded(
          child: carrousel,
        ),

        /// Wraps the controllers
        Container(
          color: DSColor.white,
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 20,
            left: 16,
            right: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: stepBullets,
                  ),
                ),
              ),

              /// Previous button
              DSButton(
                null,
                displayLabel: false,
                icon: previousButtonIcon,
                size: DSButtonSizes.big,
                shape: DSButtonShapes.round,
                kind: previousButtonVariation,
                onTap: handleBackButtonTap,
              ),
              const SizedBox(
                width: 18,
              ),

              /// Forward button
              DSButton(
                null,
                icon: forwardButtonIcon,
                size: DSButtonSizes.big,
                displayLabel: false,
                shape: DSButtonShapes.round,
                kind: DSButtonKinds.primary,
                onTap: forwardButtonCallback,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

@notations.WidgetbookUseCase(name: 'Default', type: DSWelcomeTemplate)
Widget defaultDSWelcomeTemplateUseCase(BuildContext context) {
  return DSWelcomeTemplate(
    steps: const [
      DSWelcomeStepData(
        title: 'Bem vindo!',
        paragraphs: [
          'Lorem ipsum',
          'Lorem ipsum',
          'Lorem ipsum',
          'Lorem ipsum',
        ],
      ),
      DSWelcomeStepData(
        title: 'Lorem Ipsum!',
        paragraphs: [
          'Lorem ipsum',
        ],
      ),
      DSWelcomeStepData(
        title: 'Batata',
        paragraphs: [
          'Lorem ipsum',
        ],
      ),
    ],
    onFinish: () {
      print('finished');
    },
  );
}
