import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class QuestionsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class QuizStartEvent extends QuestionsEvent {}

class OntapNextEvent extends QuestionsEvent {
  final Map<String, int> selectedValue;
  OntapNextEvent({@required this.selectedValue});
  @override
  List<Object> get props => [selectedValue];
}

class OnSubmitEvent extends QuestionsEvent {
  @override
  List<Object> get props => [];
}
