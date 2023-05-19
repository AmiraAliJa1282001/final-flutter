
import 'package:flutter/material.dart';
import '../db-helper.dart';
import 'AddQuestionScreen.dart';
import 'package:flutter_application_final/models/QuestionsModel.dart';
import 'package:sqflite/sqflite.dart';
import 'HomeScreen.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen ({Key? key}): super(key: key);
  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}



class _CreateQuizScreenState extends State<CreateQuizScreen> {

  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> allQuestionsData = [];
   TextEditingController _headerqqController = TextEditingController();
   TextEditingController _AChoiceController = TextEditingController();
   TextEditingController _BChoiceController = TextEditingController();
   TextEditingController _CChoiceController = TextEditingController();
   TextEditingController _DChoiceController = TextEditingController();
   TextEditingController _correctChoiceController = TextEditingController();
   final formGlobalKey = GlobalKey<FormState>();
   @override
    void initState() {
      _query();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.teal,
      title: Text('Create Quiz'),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
      ),
    ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddQuestionScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              ),
              icon: Icon(Icons.add, color: Colors.white),
              label: Text(
                'Add new question',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allQuestionsData.length, // replace with your dynamic data
              itemBuilder: (BuildContext context, int index) {
                var qItem = allQuestionsData[index];
                String correctval = qItem['correctChoice'];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              '${qItem['headerqq']}',
                              style: TextStyle(fontSize: 18),
                              maxLines: null, // Allow unlimited lines
                              overflow: TextOverflow.clip, // Clip the text if it exceeds the available space
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _showDeleteDialog(context,id:qItem['id']);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      _buildOption('${qItem['AChoice']}', correct:correctval=='A'),
                      SizedBox(height: 8),
                      _buildOption('${qItem['BChoice']}', correct: correctval=='B'),
                      SizedBox(height: 8),
                      _buildOption('${qItem['CChoice']}', correct: correctval=='C'),
                      SizedBox(height: 8),
                      _buildOption('${qItem['DChoice']}', correct: correctval=='D'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

    
  }

  Widget _buildOption(String text, {bool correct = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: correct ? Colors.green : Colors.white!,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: correct ? Colors.green : Colors.white!,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: correct ? Colors.white : Colors.grey[700]!),
          ),
        ],
      ),
    );
  }
  _showDeleteDialog(BuildContext context, {required id}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Delete Question',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text('Are you sure you want to delete this question?'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.teal),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.teal),
            ),
            onPressed: () {
              // TODO: Implement delete question functionality
              Navigator.of(context).pop();
              _delete(id);
            },
          ),
        ],
      );
    },
  );
}

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
    allQuestionsData = allRows;
    setState(() {});
  }

    void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.headerqq: _headerqqController.text,
      DatabaseHelper.AChoice:_AChoiceController.text,
      DatabaseHelper.BChoice:_BChoiceController.text,
      DatabaseHelper.CChoice:_CChoiceController.text,
      DatabaseHelper.DChoice:_DChoiceController.text,
      DatabaseHelper.correctChoice : _correctChoiceController.text,
      };
    print('insert stRT');
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
    _headerqqController.text = "";
    _AChoiceController.text = "";
    _BChoiceController.text = "";
    _CChoiceController.text = "";
    _DChoiceController.text = "";
    _correctChoiceController.text = "";
    _query();
  }

    void _delete(int id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
    _query();
  }
}

