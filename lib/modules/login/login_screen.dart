import 'package:discy_demo/layouts/cubit/cubit.dart';
import 'package:discy_demo/layouts/home_screen.dart';
import 'package:discy_demo/modules/login/cubit/states.dart';
import 'package:discy_demo/shared/components/components.dart';
import 'package:discy_demo/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginStateError)
          {
            showToast(
              text: state.error,
              isError: true,
            );
          }

          if (state is LoginStateSuccess)
          {
            showToast(
              text: state.token,
            );

            HomeCubit.get(context).changeIndex(0);
            HomeCubit.get(context).setData();
            navigateAndFinish(context , HomeScreen());
          }
        },
        builder: (context, state)
        {
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image(
                            image: NetworkImage(
                                'https://2code.info/demo/themes/Discy/Boxed/wp-content/themes/discy/images/logo-light-2x.png'),
                            height: 60.0,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          controller: usernameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'username must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'username',
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'password must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'password',
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          color: Colors.blue,
                          height: 40.0,
                          width: double.infinity,
                          child: FlatButton(
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                LoginCubit.get(context).login(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            child: Text(
                              'Login',
                              style: black14.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Forgot Password?',
                          style: black14.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Need an account? ',
                              style: grey14,
                            ),
                            Text(
                              'Create an account',
                              style: black14.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is LoginStateLoading) CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
