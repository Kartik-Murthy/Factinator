import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:factinator/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff153462),
      // backgroundColor: Colors.lightBlue.shade900,
      body: SafeArea(
        child: Stack(
          children: [
            CircularParticle(
              key: UniqueKey(),
              awayRadius: 80,
              numberOfParticles: 20,
              speedOfParticles: 2,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              onTapAnimation: true,
              particleColor: Colors.white.withAlpha(150),
              awayAnimationDuration: const Duration(milliseconds: 1500),
              maxParticleSize: 12,
              isRandSize: true,
              isRandomColor: false,
              awayAnimationCurve: Curves.easeInOutBack,
              connectDots: false, //not recommended
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'F a c t i n a t o r',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'Fact your way to wisdom.\nQuote your way to inspiration.',
                              textAlign: TextAlign.justify,
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500))
                        ]),
                    getStartedButton(context: context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getStartedButton({required BuildContext context}) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage())),
      child: Container(
        height: 52,
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          shadows: kElevationToShadow[9],
          color: Colors.white,
        ),
        child: const Text(
          'Get Started  ➜',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
