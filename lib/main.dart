import 'package:flutter/material.dart';
import 'package:simple_quiz_app/questionBank.dart';

void main() {
  runApp(const MyApp());
}

QuestionBrain quizBrain = QuestionBrain();

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
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
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
                    if (quizBrain.getAnswer() == true) {
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
                      quizBrain.nextQuestion();
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
                    if (quizBrain.getAnswer() == false) {
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
                      quizBrain.nextQuestion();
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
