import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../assistant/build_image.dart';
import 'registerPage.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // void _onIntroEnd(context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => ),
  //   );
  // }
  static void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const RegisterScreen()),
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
        //color: const Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 18),
        imagePadding: EdgeInsets.only(top: 10, left: 24, right: 24),
        // pageColor: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: true,
        // autoScrollDuration: 3000,

        globalFooter: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            child: const Text(
              'Let\'s go right away!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => _onIntroEnd(context),
          ),
        ),
        pages: [
          PageViewModel(
            title: 'Welcome !',
            body:
                '''Worried about managing exepenses in groupe travel ? Here you go ''',
            image: buildImage('assets/logo.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: '''Manage your trip Expense !''',
            body: '''Get glimpse everyon's exepense  managed in realtime ''',
            image: buildImage('assets/logo1.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Let's Go Travel ",
            body: '''Enjoy every moment with your friend and family  ''',
            image: buildImage('assets/plane.png'),
            decoration: getPageDecoration(),
          ),
        ],
        done: const Text('Start',
            style: const TextStyle(fontWeight: FontWeight.w600)),
        onDone: () => _onIntroEnd(context),
        showSkipButton: true,
        skip: const Text('Skip'),
        onSkip: () => _onIntroEnd(context),
        next: const Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        // globalBackgroundColor: Theme.of(context).primaryColor,
        // skipFlex: 0,
        nextFlex: 0,
        isProgressTap: true,
        isProgress: true,
        showNextButton: false,
        // freeze: true,
        // animationDuration: 10,
      ),
    );
  }
}
