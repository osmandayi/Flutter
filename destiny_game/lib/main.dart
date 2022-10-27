// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizz());
}

class Quizz extends StatelessWidget {
  const Quizz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
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
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. '
        'You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide '
        'brimmed hat and soulless eyes opens the passenger door for you and says:'
        ' "Need a ride, boy?"',
    'As you begin to drive, the stranger starts talking about his relationship with his mother. '
        'He gets angrier and angrier by the minute. He asks you to open the glove box. '
        'Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. '
        'He reaches for the glove box.',
    'You bond with the murderer while crooning verses of "Can you feel the love tonight". He'
        ' drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply:'
        ' "Try the pier."',
    'As you smash through the guardrail and careen towards the jagged rocks below you reflect'
        ' on the dubious wisdom of stabbing someone while they are driving a car you are in.',
    'He nods slowly, unphased by the question.',
    'As you begin to drive, the stranger starts talking about his relationship with his mother. '
        'He gets angrier and angrier by the minute. He asks you to open the glove box. '
        'Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. '
        'He reaches for the glove box.',
    'You bond with the murderer while crooning verses of "Can you feel the love tonight". He'
        ' drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply:'
        ' "Try the pier."',
    'As you smash through the guardrail and careen towards the jagged rocks below you reflect'
        ' on the dubious wisdom of stabbing someone while they are driving a car you are in.',
    'What? Such a cop out! Did you know accidental traffic accidents are the second leading cause of'
        'accidental death for most adult age groups?',
  ];
  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  //   true,
  //   true,
  //   true,
  //   false,
  //   true,
  //   true,
  //   false,
  //   true,
  //   true,
  //   false,
  //   false,
  //   false,
  // ];
  List<String> answersList = [
    'I\'ll hop in. Thanks for the help!',
    'Well, I don\'t have many options. Better ask him if he\'s a murderer.',
    'I love Elton John! Hand him the cassette tape.',
    'It\'s him or me. Take the knife and stab him.',
    'At least he\'s honest. I\'ll climb in.',
    'Wait, I know how to change a tire.',
    'Rewrite your scenario.',
    'Finish the game.',
  ];
  // void checkAnswer(bool userPickedAnswer) {
  //   bool correctAnswer = answers[questionNumber];
  //   if (userPickedAnswer == correctAnswer) {
  //     print('It\'s correct !');
  //     setState(() {
  //       scoreKeeper.add(
  //         const Icon(
  //           Icons.check,
  //           color: Colors.green,
  //         ),
  //       );
  //     });
  //   } else {
  //     print('It\'s wrong !');
  //     setState(() {
  //       scoreKeeper.add(
  //         const Icon(
  //           Icons.close,
  //           color: Colors.red,
  //         ),
  //       );
  //     });
  //   }
  // }

  // List<Question> questionBank = [
  //   Question(q: 'You can lead a cow down stairs but not up stairs', a: false),
  //   Question(
  //       q: 'Approximately one quarter of human bones are int he feet.',
  //       a: true),
  //   Question(q: 'A slug\'s blood is green.', a: true),
  //   Question(
  //       q: 'Havaya atılan bir madeni paranın tura gelme ihtimali 1/2\'dir.',
  //       a: true),
  //   Question(q: 'Q klavyede Q harfinin sağ tarafında W harfi vardır.', a: true),
  //   Question(q: '-2 çift bir sayıdır.', a: true),
  //   Question(q: 'Muğla Marmara Bölgesi\'ndedir.', a: false),
  //   Question(q: 'Türkiye, Birleşmiş Milletler Üyesidir.', a: true),
  //   Question(q: 'ABD, NATO üyesidir.', a: true),
  //   Question(q: '12 Eylül darbesi 1982 yılında gerçelşemiştir.', a: false),
  //   Question(q: 'Bursa, Marmara Bölgesi\'ndedir.', a: true),
  //   Question(q: 'Bütün rakamların çarpımı 0\'dır.', a: true),
  //   Question(q: 'Dana kelimesi 1 hecelidir.', a: false),
  //   Question(
  //       q: 'Noktainazar trafik polisi anlamına gelen bir kelimedir.', a: false),
  //   Question(q: 'Hakkari, Güneydoğu Anadolu Bölgesi\'ndedir.', a: false),
  // ];

  int questionNumber = 0;
  int answerNumber = 0;
  int answerNumber2 = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
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
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                //The user picked true.
                setState(() {
                  if (questionNumber == 0) {
                    questionNumber = 1;
                    answerNumber = 2;
                    answerNumber2 = 3;
                  } else if (questionNumber == 1) {
                    questionNumber = 2;
                    answerNumber = 6;
                    answerNumber2 = 7;
                  } else if (questionNumber == 4) {
                    questionNumber = 5;
                    answerNumber = 2;
                    answerNumber2 = 3;
                  } else if (questionNumber == 5) {
                    questionNumber = 6;
                    answerNumber = 6;
                    answerNumber2 = 7;
                  } else if (answerNumber == 6) {
                    Alert(
                            context: context,
                            title: "New Game",
                            desc: "Are you ready for new game ?")
                        .show();
                    questionNumber = 0;
                    answerNumber = 0;
                    answerNumber2 = 1;
                  }
                });
              },
              child: Text(
                answersList[answerNumber],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              onPressed: () {
                //The user picked false
                setState(() {
                  if (questionNumber == 0) {
                    questionNumber = 4;
                    answerNumber = 4;
                    answerNumber2 = 5;
                  } else if (questionNumber == 1) {
                    questionNumber = 3;
                    answerNumber = 6;
                    answerNumber2 = 7;
                  } else if (questionNumber == 4) {
                    questionNumber = 8;
                    answerNumber = 6;
                    answerNumber2 = 7;
                  } else if (questionNumber == 5) {
                    questionNumber = 7;
                    answerNumber = 6;
                    answerNumber2 = 7;
                  } else if (answerNumber2 == 7) {
                    Alert(
                            context: context,
                            title: "Finished",
                            desc: "You've reached the end of the destiny.")
                        .show();
                    questionNumber = 0;
                    answerNumber = 0;
                    answerNumber2 = 1;
                  }
                });
              },
              child: Text(
                answersList[answerNumber2],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        // TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
