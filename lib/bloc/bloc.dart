import 'package:SFinance/bloc/events.dart';
import 'package:SFinance/bloc/states.dart';
import "package:bloc/bloc.dart";
import 'package:firebase_database/firebase_database.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final dbRef = FirebaseDatabase.instance.reference();
  DataSnapshot questionModel;
  //QuestionModel model;
  @override
  QuestionsState get initialState => InitialQuestionState();
  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) async* {
    questionModel = await dbRef.once();
    if (event is QuizStartEvent) {
      if (questionModel.value != null) {
        List<dynamic> questions = questionModel.value["Questions"]["Questions"];
        yield QuizStartState(questions: questions);
      }
    }
  }
}
