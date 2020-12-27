import 'package:discy_demo/layouts/cubit/cubit.dart';
import 'package:discy_demo/layouts/cubit/states.dart';
import 'package:discy_demo/modules/login/login_screen.dart';
import 'package:discy_demo/shared/components/components.dart';
import 'package:discy_demo/shared/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()
              {
                navigateTo(context, LoginScreen());
              },
              child: BlocConsumer<HomeCubit, HomeStates>(
                listener: (context, state)
                {

                },
                builder: (context, state)
                {
                  return Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  HomeCubit.get(context).avatar??'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
                              ),
                            ),
                            Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          HomeCubit.get(context).userName??'Username',
                          style: black14.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            buildSettingItem(
              title: 'Edit Profile',
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
              ),
              function: () {},
            ),
            buildSettingItem(
              title: 'About Us',
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
              ),
              function: () {},
            ),
            buildSettingItem(
              title: 'Text Size',
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
              ),
              function: () {},
            ),
            buildSettingItem(
              title: 'Logout',
              function: () {},
              leading: Icon(
                Icons.logout,
                color: Colors.blue,
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingItem(
          {@required title, trailing, @required function, leading}) =>
      Column(
        children: [
          SizedBox(
            height: 2.0,
          ),
          ListTile(
            tileColor: Colors.white,
            onTap: function,
            leading: leading,
            title: Text(
              '$title',
              style: black14.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: trailing,
          ),
        ],
      );
}
