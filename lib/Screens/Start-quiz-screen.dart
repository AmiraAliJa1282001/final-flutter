
import 'package:flutter/material.dart';

import '../db-helper.dart';
import '../quiz-ui-question.dart';
import 'Keep-up-screen.dart';
import 'fail-screen.dart';

import 'sorry-start-quiz.dart';
import 'superstar-screen.dart';

class StartingQuiz extends StatefulWidget {
  const StartingQuiz({Key? key}) : super(key: key);

  @override
  State<StartingQuiz> createState() => _StartingQuizState();
}

class _StartingQuizState extends State<StartingQuiz>{
  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> allQuestionsData = [];
  PageController pageController = PageController(initialPage: 0);
   final formGlobalKey = GlobalKey<FormState>();
    int score =0;
  late PageController _pageController;

   @override
    void initState() {
      _query();
      _pageController = PageController(initialPage: 0);

      super.initState();
    }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text('start Quiz'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: allQuestionsData.length,
          itemBuilder: allQuestionsData.length>=5?(BuildContext context, int index) { 
            var questioncontent = allQuestionsData[index];
            String correctValue = questioncontent['correctChoice'];
          return UiQuestionQuiz(
          questionNumber: index+1,
          totalQuestions: allQuestionsData.length,
          headerqq: '${questioncontent['headerqq']}',
          AChoice: '${questioncontent['AChoice']}',
          BChoice: '${questioncontent['BChoice']}',
          CChoice: '${questioncontent['CChoice']}',
          DChoice: '${questioncontent['DChoice']}',
          onOptionSelected: (String selectedOption) {
                  _handleOption(selectedOption, index,correctValue);
          },

        )
        ;}:(context, index) => SorryScreen(),
        )

        )
      
    );
  }
  

    void _handleOption(String selectedOption, int currentIndex, String correctValue) {
    // Do something with the selected option
    // For example, update the score
    if (selectedOption == correctValue) {
      score++;
    }

    // Navigate to the next screen
    if (_pageController.page!.toInt() < allQuestionsData.length -1) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      double average = ((score /allQuestionsData.length)*100) ;
      if (average < 50) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultCase3Screen(score: score, total: allQuestionsData.length,)),
      );
    } else if (average < 75) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => KeepUPScreen(score: score, total: allQuestionsData.length)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuperstarScreen(score: score, total: allQuestionsData.length)),
      );
    }
    }
  }


   void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
    allQuestionsData = allRows;
    setState(() {});
  }
}