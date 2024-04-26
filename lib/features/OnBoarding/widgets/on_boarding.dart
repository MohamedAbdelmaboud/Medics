library flutter_onboarding_slider;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_expert_app/features/OnBoarding/widgets/background_controller.dart';
import 'package:medical_expert_app/features/OnBoarding/widgets/background_final_button.dart';
import 'package:medical_expert_app/features/OnBoarding/widgets/onboarding_navigation_bar.dart';
import 'package:medical_expert_app/features/OnBoarding/widgets/page_offset_provider.dart';
import 'package:provider/provider.dart';

import 'background.dart';
import 'background_body.dart';

export 'background.dart';
export 'background_final_button.dart';

class OnBoardingSlider extends StatefulWidget {
  final int totalPage;
  final Color headerBackgroundColor;
  final List<Widget> background;
  final double speed;
  final Color? pageBackgroundColor;
  final Gradient? pageBackgroundGradient;
  final Function? onFinish;
  final Widget? trailing;
  final Widget? skipTextButton;
  final List<Widget> pageBodies;
  final Function? trailingFunction;
  final FinishButtonStyle? finishButtonStyle;
  final String? finishButtonText;
  final TextStyle finishButtonTextStyle;
  final Color? controllerColor;
  final bool addButton;
  final bool centerBackground;
  final bool addController;
  final double imageVerticalOffset;
  final double imageHorizontalOffset;

  /// leading widget in the navigationBar.
  final Widget? leading;

  /// middle widget in the navigationBar.
  final Widget? middle;

  /// Whether has the floating action button to skip and the finish button
  final bool hasFloatingButton;

  /// Whether has the skip button in the bottom;
  final bool hasSkip;

  /// icon on the skip button
  final Icon skipIcon;

  /// is the indicator located on top of the screen
  final bool indicatorAbove;

  /// distance of indicator from bottom
  final double indicatorPosition;

  /// override the function for kip button in the navigator.
  final Function? skipFunctionOverride;

  OnBoardingSlider({
    required this.totalPage,
    required this.headerBackgroundColor,
    required this.background,
    required this.speed,
    required this.pageBodies,
    this.onFinish,
    this.trailingFunction,
    this.trailing,
    this.skipTextButton,
    this.pageBackgroundColor,
    this.pageBackgroundGradient,
    this.finishButtonStyle,
    this.finishButtonText,
    this.controllerColor,
    this.addController = true,
    this.centerBackground = false,
    this.addButton = true,
    this.imageVerticalOffset = 0,
    this.imageHorizontalOffset = 0,
    this.leading,
    this.middle,
    this.hasFloatingButton = true,
    this.hasSkip = true,
    this.finishButtonTextStyle = const TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    this.skipIcon = const Icon(
      Icons.arrow_forward,
      color: Colors.white,
    ),
    this.indicatorAbove = false,
    this.indicatorPosition = 90,
    this.skipFunctionOverride,
  });

  @override
  _OnBoardingSliderState createState() => _OnBoardingSliderState();
}

class _OnBoardingSliderState extends State<OnBoardingSlider> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PageOffsetNotifier(_pageController),
      child: Scaffold(
        backgroundColor: widget.pageBackgroundColor ?? null,
        floatingActionButton: widget.hasFloatingButton
            ? BackgroundFinalButton(
                buttonTextStyle: widget.finishButtonTextStyle,
                skipIcon: widget.skipIcon,
                addButton: widget.addButton,
                currentPage: _currentPage,
                pageController: _pageController,
                totalPage: widget.totalPage,
                onPageFinish: widget.onFinish,
                finishButtonStyle: widget.finishButtonStyle,
                buttonText: widget.finishButtonText,
                hasSkip: widget.hasSkip,
              )
            : SizedBox.shrink(),
        body: CupertinoPageScaffold(
          navigationBar: OnBoardingNavigationBar(
            skipFunctionOverride: widget.skipFunctionOverride,
            leading: widget.leading,
            middle: widget.middle,
            totalPage: widget.totalPage,
            currentPage: _currentPage,
            onSkip: _onSkip,
            headerBackgroundColor: widget.headerBackgroundColor,
            onFinish: widget.trailingFunction,
            finishButton: widget.trailing,
            skipTextButton: widget.skipTextButton,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: widget.pageBackgroundGradient ?? null,
              color: widget.pageBackgroundColor ?? null,
            ),
            child: SafeArea(
              child: Background(
                centerBackground: widget.centerBackground,
                imageHorizontalOffset: widget.imageHorizontalOffset,
                imageVerticalOffset: widget.imageVerticalOffset,
                background: widget.background,
                speed: widget.speed,
                totalPage: widget.totalPage,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: BackgroundBody(
                          controller: _pageController,
                          function: slide,
                          totalPage: widget.totalPage,
                          bodies: widget.pageBodies,
                        ),
                      ),
                      widget.addController
                          ? BackgroundController(
                              hasFloatingButton: widget.hasFloatingButton,
                              indicatorPosition: widget.indicatorPosition,
                              indicatorAbove: widget.indicatorAbove,
                              currentPage: _currentPage,
                              totalPage: widget.totalPage,
                              controllerColor: widget.controllerColor,
                            )
                          : SizedBox.shrink(),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Slide to Next Page.
  void slide(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  /// Skip to last Slide.
  void _onSkip() {
    _pageController.jumpToPage(widget.totalPage - 1);
    setState(() {
      _currentPage = widget.totalPage - 1;
    });
  }
}
