
class Question {
   int id;
   String headerqq;
   String AChoice;
   String BChoice;
   String CChoice;
   String DChoice;
   String correctChoice;

  Question.formDBMap(Map<String, dynamic> map)
    : id = map['id'],
    headerqq = map['headerqq'],
    AChoice = map['AChoice'],
    BChoice = map['BChoice'],
    CChoice = map['CChoice'],
    DChoice = map['DChoice'],
    correctChoice = map['correctChoice'];

    Map<String, dynamic> toDbMap(){
      var map = Map<String, dynamic>();
      map['columnId'] = id;
      map['headerqq'] = headerqq;
      map['AChoice'] = AChoice;
      map['BChoice'] = BChoice;
      map['CChoice'] = CChoice;
      map['DChoice'] = DChoice;
      map['correctChoice'] = correctChoice;

      return map;
    }

  
}

