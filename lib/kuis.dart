import 'package:flutter/material.dart';

class KuisKecilPage extends StatefulWidget {
  @override
  _KuisKecilPageState createState() => _KuisKecilPageState();
}

class _KuisKecilPageState extends State<KuisKecilPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _showLoveEmote = false;

  List<Question> _questions = [
    Question(
      questionText: "Apa warna favorit abng?",
      options: ["Ungu", "Biru", "Hijau", "Kuning"],
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.green,
        Colors.yellow
      ],
      correctOptionIndex: 1,
    ),
    Question(
      questionText: "Dimana tempat pertama kita bertemu?",
      options: ["Lapangan SBBK", "Kafe", "undangan", "Pajak"],
      colors: [Colors.blue, Colors.blue, Colors.blue, Colors.blue],
      correctOptionIndex: 2,
    ),
    Question(
      questionText: "Apa makanan favorit kita?",
      options: ["Seblak", "Mi Goreng", "Mi ayam", "Nasi Uduk"],
      colors: [Colors.blue, Colors.blue, Colors.blue, Colors.blue],
      correctOptionIndex: 2,
    ),
  ];

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _questions[_currentQuestionIndex].correctOptionIndex) {
      setState(() {
        _score++;
      });

      if (_score == 3) {
        setState(() {
          _showLoveEmote = true;
        });
      }
    }

    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis Kecil'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5), // Opacity untuk membuat background agak transparan
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: _currentQuestionIndex < _questions.length
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              _questions[_currentQuestionIndex].questionText,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                          ..._questions[_currentQuestionIndex].options.map((option) {
                            int optionIndex = _questions[_currentQuestionIndex]
                                .options
                                .indexOf(option);
                            return ElevatedButton(
                              onPressed: () => _answerQuestion(optionIndex),
                              child: Text(option),
                            );
                          }).toList(),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Kuis Selesai!',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Skor Anda: $_score dari ${_questions.length}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _currentQuestionIndex = 0;
                                _score = 0;
                                _showLoveEmote = false; // Reset visibilitas emote love
                              });
                            },
                            child: Text(
                              'Mulai Lagi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          if (_showLoveEmote) // Tampilkan emote love jika skor mencapai 3 dari 3
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: TweenAnimationBuilder(
                  duration: Duration(milliseconds: 800),
                  tween: Tween(begin: -30.0, end: -70.0),
                  builder: (context, double value, child) {
                    return Transform.translate(
                      offset: Offset(0, value),
                      child: Text(
                        '❤️',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final List<Color> colors;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.colors,
    required this.correctOptionIndex,
  });
}
