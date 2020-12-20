import 'package:discy_demo/shared/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => buildItem(),
      separatorBuilder: (context, index) => Container(
        width: double.infinity,
        height: 3.0,
        color: Colors.grey[300],
      ),
      itemCount: 15,
    );
  }

  Widget buildItem() => Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Language',
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
                  'Asked at April 19,2018',
                  style: grey14,
                ),
                Spacer(
                  flex: 1,
                ),
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
                'Is this statement, “i see him last night” can be understood as “I saw him last night”?',
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
                            'Abdullah Mansour',
                            style: black16.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
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
                              color: Colors.indigo,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            child: Text(
                              'Professional',
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
                              '5',
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
              child: Text(
                'In my local language (Bahasa Indonesia) there are no verb-2 or past tense form as time tracker. So, I often forget to use the past form of verb when speaking english.I saw him last night (correct)I see him last night ...',
                style: black16,
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
                    '56',
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
                    '5 Answers',
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
