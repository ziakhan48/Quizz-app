import 'qustionclass.dart';
class Quizbrain{
  int _questionsnumber=0;
  List<Qustion>_qustionbank=[
    Qustion(q:'pakistan and india is neighber countries',n:true),
    Qustion(q:'national flower of pakistan is jasmine',n:true),
    Qustion(q:'national animal of pakistan is tiger',n:false),
    Qustion(q:'pakistan and india is neighber countries',n:true),
    Qustion(q:'national flower of pakistan is jasmine',n:true),
    Qustion(q:'national animal of pakistan is tiger',n:false),
    Qustion(q:'founder of pakistan is allama iqbal',n:false ),
  ];


  void questionnumberest(int number){
    _questionsnumber=number;
  }
  bool nextquestion() {
    if(_questionsnumber < _qustionbank.length-1) {
      _questionsnumber++;

      return false;
    }
    return true;
  }

String getquestiontext(){
    return _qustionbank[_questionsnumber].questiontext;
  }
  bool getcorretanswer(){
    return _qustionbank[_questionsnumber].qustionans;
  }

}