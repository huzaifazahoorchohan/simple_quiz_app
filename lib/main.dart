import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz App",
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> checkQuestion = [];

  List<String> questions = [
    "There are two parts of the body that can't heal themselves",
    "Howard Donald is the oldest member of Take That",
    "The Great Wall of China is longer than the distance between London and Beijing",
    "There are 219 episodes of Friends",
    "'A' is the most common letter used in the English language",
  ];

  List<bool> questionAnswers = [
    false,
    true,
    true,
    false,
    false,
  ];

  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    questions[questionIndex],
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (questionAnswers[questionIndex] == true) {
                      print("right answer");
                    } else {
                      print("wrong answer");
                    }
                    setState(() {
                      checkQuestion.add(
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                      questionIndex++;
                    });
                  },
                  child: const Text(
                    "True",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    if (questionAnswers[questionIndex] == false) {
                      print("right answer");
                    } else {
                      print("wrong answer");
                    }
                    setState(() {
                      checkQuestion.add(
                        const Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                      );
                      questionIndex++;
                    });
                  },
                  child: const Text(
                    "False",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: checkQuestion,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
