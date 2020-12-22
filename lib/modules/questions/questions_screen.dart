import 'package:conditional_builder/conditional_builder.dart';
import 'package:discy_demo/models/question_model.dart';
import 'package:discy_demo/modules/questions/cubit/cubit.dart';
import 'package:discy_demo/modules/questions/cubit/states.dart';
import 'package:discy_demo/shared/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

class QuestionsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => QuestionsCubit()..getQuestions(),
      child: BlocConsumer<QuestionsCubit, QuestionsStates>(
        listener: (context, state)
        {

        },
        builder: (context, state)
        {
          var list = QuestionsCubit.get(context).questions;

          return ConditionalBuilder(
            condition: state is! QuestionsStateLoading,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index)
              {
                QuestionModel(list[index]);
                return buildItem(list[index]);
              },
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 3.0,
                color: Colors.grey[300],
              ),
              itemCount: list.length,
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget buildItem(question) => Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${question['categories'][0]['name']}',
                  style: black14,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 5.0,
                    height: 2.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Asked at ${QuestionModel.getDate()}',
                  style: grey14,
                ),
                Spacer(),
                CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.flag_outlined,
                    color: Colors.black54,
                    size: 18.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                QuestionModel.getTitle(),
                style: black18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(question['author']['avatar']),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${question['author']['name']}',
                            style: black16.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          if(question['author']['verified'] != null && question['author']['verified'])
                            CircleAvatar(
                            radius: 10.0,
                            child: Icon(
                              Icons.check,
                              size: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                2,
                              ),
                              color: HexColor(question['author']['badge']['color']),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            child: Text(
                              question['author']['badge']['name'].toString(),
                              style: black14.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          IconButton(
                            icon: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.grey[300],
                              child: Icon(
                                Icons.arrow_drop_up,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: Text(
                              question['custom_fields']['question_vote'] != null ? '${question['custom_fields']['question_vote'][0]??'0'}' : '0',
                              style: grey14,
                            ),
                          ),
                          IconButton(
                            icon: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.grey[300],
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Html(
                data: '${question['content']}',
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
              ),
              child: Row(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 40.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        '+ Answer',
                        style: black14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.remove_red_eye_rounded,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${question['custom_fields']['post_stats'][0]}',
                    style: grey14,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.question_answer_outlined,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${question['custom_fields']['comment_count'][0]??'0'} Answers',
                    style: grey14,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.favorite,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
