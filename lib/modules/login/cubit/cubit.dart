import 'package:discy_demo/layouts/cubit/cubit.dart';
import 'package:discy_demo/modules/login/cubit/states.dart';
import 'package:discy_demo/shared/components/components.dart';
import 'package:discy_demo/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStateInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  login({
    @required username,
    @required password,
  }) {
    emit(LoginStateLoading());

    DioHelper.getData(
      path: 'demo/themes/Discy/Boxed/api/user/login',
      query: {
        'insecure': 'cool',
        'username': username,
        'password': password,
        'device_token': 123,
      },
    ).then((value)
    {
      //print(value.data);

      if(value.data['status'] as bool)
      {
        print(value.data);

        saveToken(value.data['token']).then((d)
        {
          saveUsername(value.data['user']['displayname']).then((d)
          {
            saveAvatar(value.data['user']['avatar']).then((d)
            {
              emit(LoginStateSuccess(value.data['token']));
            });
          });
        });
      } else
        {
          print('error');
          print(value.data['error']);
          emit(LoginStateError(value.data['error']));
        }
    }).catchError((e)
    {
      print(e.toString());
      emit(LoginStateError(e.toString()));
    });
  }
}
