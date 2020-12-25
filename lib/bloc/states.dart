import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class QuestionsState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialQuestionState extends QuestionsState {
  @override
  List<Object> get props => [];
}

class QuizStartState extends QuestionsState {
  final List<dynamic> questions;
  QuizStartState({@required this.questions});
  @override
  List<Object> get props => [];
}

class OnSubmitState extends QuestionsState {
  @override
  List<Object> get props => [];
}
