// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:quizz_app_true_or_false/result_page.dart';

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
        backgroundColor: Colors.grey.shade900,
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
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'Balonla Beş Hafta kitabında gezilen kıta Asya\'dır.',
    'Uruguay\'ın resmi adı Uruguay Doğu Cumhuriyeti\'dir.',
    'İtalya\'da Bir Türk Sevdim romanındaki Türk\'ün adı Mehmet\'tir.',
    'Havaya atılan bir madeni paranın tura gelme ihtimali 1/2\'dir',
    'Q klavyede Q harfinin sağ tarafında W harfi vardır.',
    '-2 çift bir sayıdır.',
    'Muğla Marmara Bölgesi\'ndedir.',
    'Türkiye, Birleşmiş Milletler üyesidir.',
    'ABD, NATO üyesidir.',
    '12 Eylül darbesi 1982 yılında gerçekleşmiştir.',
    'Bursa, Marmara Bölgesi\'ndedir.',
    'Bütün rakamların çarpımı 0\'dır.',
    'Dana kelimesi 1 hecelidir.',
    'Noktainazar trafik polisi anlamına gelen bir kelimedir.',
    'Hakkari, Güneydoğu Anadolu Bölgesi\'ndedir.',
  ];
  List<bool> answers = [
    false,
    true,
    true,
    true,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    false,
    false,
  ];

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
  int dogrusayiniz = 0;
  int resetdogru = 0;

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
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == true) {
                  print('It\'s correct !');
                  setState(() {
                    scoreKeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                  dogrusayiniz++;
                } else {
                  print('It\'s wrong !');
                  setState(() {
                    scoreKeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                if (questionNumber < questions.length - 1) {
                  questionNumber++;
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => result_page(
                        dogru: resetdogru,
                      ),
                    ),
                  );
                  resetdogru = dogrusayiniz;
                  dogrusayiniz = 0;
                  questionNumber = 0;
                  scoreKeeper.clear();
                }
              },
              child: const Text(
                'True',
                style: TextStyle(
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
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == false) {
                  print('It\'s correct !');
                  setState(() {
                    scoreKeeper.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  });
                  dogrusayiniz++;
                } else {
                  print('It\'s wrong !');
                  setState(() {
                    scoreKeeper.add(
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  });
                }
                if (questionNumber < questions.length - 1) {
                  questionNumber++;
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => result_page(
                        dogru: resetdogru,
                      ),
                    ),
                  );

                  resetdogru = dogrusayiniz;
                  dogrusayiniz = 0;
                  questionNumber = 0;
                  scoreKeeper.clear();
                }
              },
              child: const Text(
                'False',
                style: TextStyle(
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
