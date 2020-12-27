import 'package:discy_demo/modules/single_category/cubit/states.dart';
import 'package:discy_demo/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryStates>
{
  SingleCategoryCubit() : super(SingleCategoryStateInitial());

  static SingleCategoryCubit get(context) => BlocProvider.of(context);

  List questions = [];

  getSingleCategory(int id)
  {
    print(id);

    emit(SingleCategoryStateLoading());

    DioHelper.getData(
      path: 'demo/themes/Discy/Boxed/api/get_category_posts',
      query:
      {
        'taxonomy':'question-category',
        'id':id,
      },
    ).then((value)
    {
      emit(SingleCategoryStateSuccess());

      //print(value.data);
      questions = value.data['posts'];
    }).catchError((e)
    {
      print(e.toString());
      emit(SingleCategoryStateError(e.toString()));
    });
  }
}