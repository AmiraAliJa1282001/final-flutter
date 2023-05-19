
import 'package:flutter/material.dart';

class UiQuestionQuiz extends StatelessWidget{
      final int questionNumber;
  final int totalQuestions;
  final String headerqq;
  final String AChoice;
  final String BChoice;
  final String CChoice;
  final String DChoice;
  final Function(String) onOptionSelected;

   const UiQuestionQuiz({
    Key? key,
    required this.questionNumber,
    required this.totalQuestions,
    required this.headerqq,
    required this.AChoice,
    required this.BChoice,
    required this.CChoice,
    required this.DChoice,
    required this.onOptionSelected,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                  children: [
                    TextSpan(
                      text: 'Question ${questionNumber.toString()}',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(
                      text: ' / ${totalQuestions.toString()}',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.0),
              Container(
                 padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  '$headerqq',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 16.0),
              SizedBox(height: 8.0),
              _buildBChoiceutton(context,'A', AChoice),
              SizedBox(height: 8.0),
              _buildBChoiceutton(context,'B', BChoice),
              SizedBox(height: 8.0),
              _buildBChoiceutton(context,'C', CChoice),
              SizedBox(height: 8.0),
              _buildBChoiceutton(context,'D', DChoice),
              SizedBox(height: 16.0),
              
            ],
          ),
        ),
      );
  }
  Widget _buildBChoiceutton(BuildContext context, String option, String text) {

  return SizedBox(
    height: 48.0,
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        primary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.teal),
        ),
      ),
      onPressed: () {
        onOptionSelected(option);
      },
      child: Text(
        '$text',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

}