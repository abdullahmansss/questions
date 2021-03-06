import 'package:discy_demo/modules/questions/cubit/states.dart';
import 'package:discy_demo/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsCubit extends Cubit<QuestionsStates>
{
  QuestionsCubit() : super(QuestionsStateInitial());

  static QuestionsCubit get(context) => BlocProvider.of(context);

  List questions = [];

  int currentPage = 2;
  int totalPages = 0;

  getQuestions()
  {
    emit(QuestionsStateLoading());

    DioHelper.getData(
      path: 'demo/themes/Discy/Boxed/api/get_recent_posts',
      query: {
        'post_type':'question',
        'count':10,
      },
    ).then((value)
    {
      emit(QuestionsStateSuccess());

      //print(value.data);
      totalPages = value.data['pages'];
      questions = value.data['posts'];
    }).catchError((e)
    {
      print(e.toString());
      emit(QuestionsStateError(e.toString()));
    });
  }

  getMoreQuestions()
  {
    DioHelper.getData(
      path: 'demo/themes/Discy/Boxed/api/get_recent_posts',
      query: {
        'post_type':'question',
        'count':10,
        'page':currentPage,
      },
    ).then((value)
    {
      emit(QuestionsStateSuccess());

      //print(value.data);
      questions.addAll(value.data['posts']);
      currentPage ++;
    }).catchError((e)
    {
      print(e.toString());
      emit(QuestionsStateError(e.toString()));
    });
  }
}