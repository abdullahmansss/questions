abstract class QuestionsStates {}

class QuestionsStateInitial extends QuestionsStates{}

class QuestionsStateLoading extends QuestionsStates{}

class QuestionsStateSuccess extends QuestionsStates{}

class QuestionsStateError extends QuestionsStates
{
  String error;

  QuestionsStateError(this.error);
}