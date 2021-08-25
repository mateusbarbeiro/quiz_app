import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
    runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
    const Quizzler({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                backgroundColor: Colors.grey[900],
                body: const SafeArea(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: QuizPage(),
                    ),
                ),
            ),
        );
    }
}

class QuizPage extends StatefulWidget {
    const QuizPage({Key? key}) : super(key: key);

    @override
    _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
    List<Icon> score = [];

    int correctAnswer = 0;

    void checkAnswer(bool userPicked) {
        setState(() {
            if (quizBrain.isFinished()) {
                Alert(
                    context: context,
                    title: 'Parabéns, Você chegou a última pergunta!',
                    content: RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontWeight: FontWeight.w100, 
                                color: Colors.black,
                                fontSize: 18
                            ),
                            children: <TextSpan>[
                                const TextSpan(text: 'Acertou '),
                                TextSpan(
                                    text: '$correctAnswer',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                TextSpan(text: ' de ${quizBrain.getLength()} perguntas')
                            ],
                        ),
                    ),
                ).show();

                quizBrain.reset();
                score = [];
            } else {
                if (quizBrain.getQuestionAnswer() == userPicked) {
                    score.add(
                        const Icon(
                            Icons.check,
                            color: Colors.green,
                        ),
                    );
                    correctAnswer++;
                } else {
                    score.add(
                        const Icon(
                            Icons.close,
                            color: Colors.red,
                        ),
                    );
                }

                quizBrain.nextQuestion();
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Expanded(
                    flex: 5,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                                quizBrain.getQuestionText(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                ),
                            ),
                        ),
                    ),
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.green),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(color: Colors.white),
                                ),
                            ),
                            child: const Text(
                                'Verdadeiro',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                ),
                            ),
                            onPressed: () {
                                checkAnswer(true);
                            },
                        ),
                    ),
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                            ),
                            child: const Text(
                                'Falso',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                ),
                            ),
                            onPressed: () {
                                checkAnswer(false);
                            },
                        ),
                    ),
                ),
                Row(children: score),
            ],
        );
    }
}
