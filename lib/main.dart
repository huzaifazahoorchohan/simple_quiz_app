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
  int score = 0;

  void checkAnwser(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        if (quizBrain.getAnswer() == userPickedAnswer) {
          checkQuestion.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          checkQuestion.add(const Icon(
            Icons.clear,
            color: Colors.red,
          ));
        }
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Finished"),
                content: const Text("You have reached the end of the quiz"),
                actions: [
                  Text(
                    "You Scored $score out of",
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    quizBrain.howManyQuestion().toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        quizBrain.reset();
                        checkQuestion = [];
                        score = 0;
                      });
                    },
                    child: const Text("Restart"),
                  ),
                ],
              );
            });
      } else {
        if (quizBrain.getAnswer() == userPickedAnswer) {
          score++;
          checkQuestion.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          checkQuestion.add(const Icon(
            Icons.clear,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

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
                    checkAnwser(true);
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
                    checkAnwser(false);
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
