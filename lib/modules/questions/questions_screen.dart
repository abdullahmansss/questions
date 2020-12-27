import 'package:conditional_builder/conditional_builder.dart';
import 'package:discy_demo/models/question_model.dart';
import 'package:discy_demo/modules/questions/cubit/cubit.dart';
import 'package:discy_demo/modules/questions/cubit/states.dart';
import 'package:discy_demo/modules/single_category/single_category_screen.dart';
import 'package:discy_demo/shared/components/components.dart';
import 'package:discy_demo/shared/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

class QuestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QuestionsCubit()..getQuestions(),
      child: BlocConsumer<QuestionsCubit, QuestionsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = QuestionsCubit.get(context).questions;

          return ConditionalBuilder(
            condition: state is! QuestionsStateLoading,
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  listOfQuestions(
                    list: list,
                    isScrollable: false,
                  ),
                  MaterialButton(
                    onPressed: ()
                    {
                      if(QuestionsCubit.get(context).currentPage <= QuestionsCubit.get(context).totalPages)
                      {
                        QuestionsCubit.get(context).getMoreQuestions();
                      } else
                        {
                          showToast(text: 'No More Data ..');
                        }
                    },
                    child: Text(
                      'Load More ...',
                      style: black16.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
