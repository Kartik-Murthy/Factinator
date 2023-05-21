import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dart_openai/openai.dart';
import 'package:factinator/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FactsPage extends StatefulWidget {
  const FactsPage({super.key, required this.input});
  final String? input;
  @override
  State<FactsPage> createState() => _FactsPageState();
}

class _FactsPageState extends State<FactsPage> {
  List<String>? responseList;
  int _selectedIndex = 0;
  bool isLoading = false;
  @override
  void initState() {
    OpenAI.apiKey = Env.openaiKey;
    setUpTimedFetch();
    super.initState();
  }

  setUpTimedFetch() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    await modelData().then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
          responseList = value.choices.first.message.content
              .trim()
              .split(RegExp(r'(Fact:\s?)|(Quote:\s?)|(Author:\s?)'));
        });
      }
    });
  }

//
// Timer.periodic(const Duration(seconds: 30), (timer) {
//       setUpTimedFetch();
//     });
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  Future<OpenAIChatCompletionModel> modelData() async {
    return await OpenAI.instance.chat.create(
        model: "gpt-3.5-turbo",
        messages: modelResponse(
            input: widget.input != null
                ? widget.input!.isNotEmpty
                    ? widget.input!
                    : "random"
                : "random"),
        temperature: 0.6,
        frequencyPenalty: 1.0);
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.copy),
        onPressed: () async {
          await Clipboard.setData(
                  ClipboardData(text: responseList?[_selectedIndex + 1] ?? ""))
              .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('copied to clipboard'))));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => mounted
            ? setState(() {
                _selectedIndex = value;
                pageController.animateToPage(value,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              })
            : {},
        elevation: 120,
        items: buildBottomNavBarItems(),
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(color: Colors.white, size: 36),
        unselectedIconTheme: const IconThemeData(size: 28),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: PageView(
            allowImplicitScrolling: true,
            controller: pageController,
            onPageChanged: (index) {
              if (mounted) {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
            children: <Widget>[
              pageText(1),
              pageText(2),
            ],
          )),
    );
  }

  AnimatedTextKit pageText(int index) {
    return AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
      TypewriterAnimatedText(
        'Generating Some ${index == 1 ? 'Suprising Facts' : 'Good Quotes'} For You. Please Wait A While.',
        textAlign: TextAlign.justify,
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
      ),
      TypewriterAnimatedText(
          responseList?[index] ?? 'Oops, Something went wrong',
          textAlign: TextAlign.justify,
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500))
    ]);
  }
}

List<OpenAIChatCompletionChoiceMessageModel> modelResponse(
    {required String input}) {
  return [
    const OpenAIChatCompletionChoiceMessageModel(
      content:
          "Generate unique fact, quote(without author) and author from the user's input.The output format should look like:-Fact:fact, Quote:quote, Author:author. The quote and author must be separate just like the format",
      role: OpenAIChatMessageRole.system,
    ),
    const OpenAIChatCompletionChoiceMessageModel(
      content:
          "Even if input is same as previous input, the output should be different each time",
      role: OpenAIChatMessageRole.system,
    ),
    const OpenAIChatCompletionChoiceMessageModel(
      content:
          "If input is \"random\" then generate a random fact,quote and author",
      role: OpenAIChatMessageRole.system,
    ),
    const OpenAIChatCompletionChoiceMessageModel(
      content:
          "If you cannot understand the information then mock the user and rephrase it by assuming a different personality each time you answer from:- angry, happy, sad, embarrassed, wise, sarcastic, savage, uncanny, intelligent, funny, cool. DON'T ASK FOR A VALID INPUT.",
      role: OpenAIChatMessageRole.system,
    ),
    const OpenAIChatCompletionChoiceMessageModel(
      content: "dbFdvv",
      role: OpenAIChatMessageRole.user,
    ),
    const OpenAIChatCompletionChoiceMessageModel(
        role: OpenAIChatMessageRole.assistant,
        content:
            "Wow, that's a really interesting fact! I never knew that \"dbFdvv\" is actually an acronym for \"Don't Believe Fake Data Visualizations, Verify!\" Thanks for sharing such important information with me. As a wise fact generator, I always appreciate learning new things."),
    const OpenAIChatCompletionChoiceMessageModel(
      content: "olkjgkyuftyd",
      role: OpenAIChatMessageRole.user,
    ),
    const OpenAIChatCompletionChoiceMessageModel(
        role: OpenAIChatMessageRole.assistant,
        content:
            "I'm sorry, I couldn't understand what you meant by \"olkjgkyuftyd\". It seems like gibberish to me. As a sarcastic fact generator, I could assume that this is a new language that only you can understand, and you are secretly communicating with someone in front of me. Or maybe it's just a typo and you meant to say something else? Let's try again!"),
    const OpenAIChatCompletionChoiceMessageModel(
      content: "carrot",
      role: OpenAIChatMessageRole.user,
    ),
    const OpenAIChatCompletionChoiceMessageModel(
        role: OpenAIChatMessageRole.assistant,
        content:
            "Fact:Thanks for your input! Did you know that carrots are not only good for your eyesight but also contain antioxidants that may help reduce the risk of cancer and other diseases? As a healthy fact generator, I always encourage people to include carrots in their diet. So go ahead and enjoy some crunchy carrot sticks as a snack or add them to your salads and stir-fries!Quote:I have a passion for vegetables, particularly broccoli and carrots. But there's nothing wrong with a bit of bacon.Author:Jamie Oliver"),
    const OpenAIChatCompletionChoiceMessageModel(
      content: "blue",
      role: OpenAIChatMessageRole.user,
    ),
    const OpenAIChatCompletionChoiceMessageModel(
        role: OpenAIChatMessageRole.assistant,
        content:
            "Fact:As an intelligent fact generator, here's an interesting fact about the color blue: Did you know that blue light can actually help improve your mood and increase your alertness? This is because it suppresses the production of melatonin, a hormone that makes you feel sleepy. So if you're feeling tired during the day, try exposing yourself to more blue light - whether it's through natural sunlight or artificial sources like a special lamp designed for this purpose!Quote:Blue color is everlastingly appointed by the deity to be a source of delight.Author:John Ruskin."),
    const OpenAIChatCompletionChoiceMessageModel(
      content: "light",
      role: OpenAIChatMessageRole.user,
    ),
    const OpenAIChatCompletionChoiceMessageModel(
        role: OpenAIChatMessageRole.assistant,
        content:
            "Fact:Interesting topic! Did you know that light is both a wave and a particle? This phenomenon is known as wave-particle duality, and it was first proposed by Albert Einstein in 1905. Light behaves like a wave when it travels through space, but when it interacts with matter, it behaves like a particle called a photon. As an intelligent fact generator, I find this concept fascinating!Quote:The light shines in the darkness, and the darkness has not overcome it.Author:John 1:5, The Bible."),
    OpenAIChatCompletionChoiceMessageModel(
      content: input,
      role: OpenAIChatMessageRole.user,
    ),
  ];
}

List<BottomNavigationBarItem> buildBottomNavBarItems() {
  return [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.fact_check,
        ),
        activeIcon: Icon(Icons.fact_check_outlined),
        label: 'Fact',
        backgroundColor: Color(0xff153462)),
    const BottomNavigationBarItem(
        icon: Icon(Icons.format_quote_rounded),
        activeIcon: Icon(Icons.format_quote_outlined),
        label: 'Quote',
        backgroundColor: Color(0xff153462)),
  ];
}
