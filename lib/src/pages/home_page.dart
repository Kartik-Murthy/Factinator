import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:factinator/src/pages/facts_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  bool _showUI = false;
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: GestureDetector(
          onTap: () => setState(() {
            _showUI = true;
          }),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  SizedBox(
                    height: _showUI
                        ? 220
                        : MediaQuery.of(context).size.height - 120,
                    child: _showUI
                        ? const Text(
                            'Factinator is like your personal fact-finding assistant! Just give it some text to work with, and it will magically generate cool and interesting facts and quotes for you.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.justify,
                          )
                        : buildUpperUI(),
                  ),
                  AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      switchInCurve: Curves.easeIn,
                      child: _showUI
                          ? buildLowerUI()
                          : const SizedBox(
                              // height: MediaQuery.of(context).size.height - 220,
                              ))
                ],
              ),
            ),
          ),
        ));
  }

  AnimatedTextKit buildUpperUI() {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      displayFullTextOnTap: true,
      onTap: () => setState(() {
        _showUI = true;
      }),
      onFinished: () => setState(() {
        _showUI = true;
      }),
      animatedTexts: [
        TypewriterAnimatedText(
            'Factinator is like your personal fact-finding assistant! Just give it some text to work with, and it will magically generate cool and interesting facts and quotes for you.',
            speed: const Duration(milliseconds: 15),
            textAlign: TextAlign.justify,
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ))
      ],
    );
  }

  buildLowerUI() => Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type anything or nothing at all'),
            maxLines: 6,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 140,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FadeAnimatedText(fadingTextList[_index],
                    duration: const Duration(milliseconds: 10000),
                    fadeInEnd: 0.1,
                    fadeOutBegin: 0.8,
                    textAlign: TextAlign.justify,
                    textStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    )),
              ],
              onNextBeforePause: ((p0, p1) {
                setState(() {
                  _index = Random().nextInt(10);
                });
              }),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FactsPage(
                      input: _controller.text.trim(),
                    ),
                  ));
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(52)),
            child: const Text(
              'Factinate !!!',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      );
}

const List fadingTextList = [
  'Dr. Heinz Doofenshmirtz, is always up to no good, trying to take over the Tri-State Area with his bizarre gadgets and schemes. But let\'s be honest, we can\'t help but root for him and his hilarious antics!',
  'Want to impress your friends with interesting facts? Just ask Factinator to work its magic and voila! You\'ll have a treasure trove of random trivia at your fingertips',
  'Factinator is like a mischievous genie! If you don\'t provide any text for it to work with, it\'ll just go ahead and grant your wish for random, wacky facts and quotes!',
  'Factinator is a cool cat! It needs a good internet connection to work, but it won\'t break a sweat if it encounters a hiccup. It\'ll just use its feline instincts to pounce back with fun facts and quotes!',
  'P.S. - Factinator is our little secret! If Perry The Platypus asks, we\'re just really good at coming up with fun facts and quotes on the fly!',
  'P.S. - Factinator is like a magician\'s hat! It never runs out of tricks, and always has a new fact or quote up its sleeve to keep you entertained.',
  'What\'s Factinator\'s favorite thing to do on a Saturday night? Hosting a fact-filled game night with friends, of course!',
  'How many Factinators does it take to change a lightbulb? Just one, but it will also provide you with a fun fact about electricity!',
  'What do you call a Factinator that has run out of interesting facts? A Factin-NO-ter!',
  'Whatever your mind can come up with, go ahead and type it - Factinator is up for the challenge!'
];
