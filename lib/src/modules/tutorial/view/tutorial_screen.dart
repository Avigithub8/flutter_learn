import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_learn/src/modules/preference/preference.dart';
// import 'package:flutter_learn/src/modules/preference/preference_helper.dart';
// import 'package:flutter_learn/module/tutorial/view/indicator_item.dart';
// import 'package:flutter_learn/module/tutorial/model/tutorial_model.dart';
// import 'package:flutter_learn/module/tutorial/view/tutorial_item.dart';
import 'package:flutter_learn/src/modules/tutorial/model/tutorial_model.dart';
import 'package:flutter_learn/src/modules/tutorial/view/indicator_item.dart';
import 'package:flutter_learn/src/modules/tutorial/view/tutorial_item.dart';
//import 'package:flutter_learn/src/routes/app_routes.dart';

const int _tutorialItemBase = 1000;

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Timer? _timer;
  int _currentPage = 0;
  final PageController _pageController =
      PageController(initialPage: _tutorialItemBase);

  final List<TutorialModel> _tutorialModel = [
    TutorialModel(
      imageUrl: 'assets/images/img1.jpeg',
      title: 'A Cool Way to Get Start',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
    ),
    TutorialModel(
      imageUrl: 'assets/images/img2.jpeg',
      title: 'Design Interactive App UI',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
    ),
    TutorialModel(
      imageUrl: 'assets/images/img3.jpeg',
      title: 'It\'s Just the Beginning',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
    ),
    TutorialModel(
      imageUrl: 'assets/images/img5.jpeg',
      title: 'Good Evening Friends!!',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _stopTimer();
  }

  _startTimer() {
    _timer = _getTimer();
  }

  _stopTimer() {
    _timer?.cancel();
  }

  Timer _getTimer() {
    return Timer.periodic(const Duration(seconds: 2), (timer) {
      _nextPage();
    });
  }

  _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = _getRealIndex(index);
    });
  }

  int _getRealIndex(int index) {
    int length = _tutorialModel.length;
    int offset = index - _tutorialItemBase;
    int result = offset % length;
    return result < 0 ? length + result : result;
  }

  navigateToLogin() {
    Preference.setIsTutorialScreen(true);
    //Navigator.of(context).pushNamed(AppRoute.screenSecond);
    Navigator.of(context).pushNamed('LoginScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: _buildPageView(),
            ),
            _buildIndicatorView(),
            const SizedBox(
              height: 20,
            ),
            _skipButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemBuilder: (ctx, i) => GestureDetector(
        onLongPressStart: (_) {
          _stopTimer();
        },
        onLongPressEnd: (_) {
          _startTimer();
        },
        child: Container(
          color: Colors.white,
          child: TutorialItem(_tutorialModel[_currentPage]),
        ),
      ),
    );
  }

  Widget _buildIndicatorView() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < _tutorialModel.length; i++)
          IndicatorItem(i == _currentPage)
      ],
    );
  }

  Widget _skipButton() {
    return ElevatedButton(
        onPressed: navigateToLogin,
        child: const Text(
          'Skip',
          style: TextStyle(
            color: Colors.red,
          ),
        ));
  }
}
