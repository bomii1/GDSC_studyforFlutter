import 'package:flutter/material.dart';
import 'package:second_app/data/question.dart';
import 'package:second_app/question_screen.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = []; // var 을 붙이면 안되는 이유?
  var activeScreen = 'start-screen';

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  // Widget? activeScreen; // 처음에 NULL 1
  // Widget activeScreen = StartScreen(switchScreen); -> 에러가 나는 이유?

  // @override 1
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    // 밖으로 빼서 가독성 높이기
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: _selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 62, 0, 170),
                Color.fromARGB(255, 29, 6, 69),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}



// 방법 2
//   void switchScreen() {
//     setState(() {
//       activeScreen = 'question-screen';
//     });
//   }

//   @override
//   Widget build(context) {

//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 62, 0, 170),
//                 Color.fromARGB(255, 29, 6, 69),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: activeScreen == 'start-screen'
//               ? StartScreen(switchScreen)
//               : const QuestionsScreen(),
//         ),
//       ),
//     );
//   }
// }
