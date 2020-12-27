import 'package:discy_demo/layouts/cubit/states.dart';
import 'package:discy_demo/modules/categories/categories_screen.dart';
import 'package:discy_demo/modules/favourites/favourites_screen.dart';
import 'package:discy_demo/modules/questions/questions_screen.dart';
import 'package:discy_demo/modules/settings/settings_screen.dart';
import 'package:discy_demo/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit() : super(HomeStateInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  var userName;
  var avatar;

  var widgets =
  [
    QuestionsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ];

  var titles = [
    Image(
      image: NetworkImage('https://2code.info/demo/themes/Discy/Boxed/wp-content/themes/discy/images/logo-light-2x.png'),
      height: 40.0,
    ),
    Text(
      'Categories',
      style: TextStyle(color: Colors.black),
    ),
    Text(
      'Favourites',
      style: TextStyle(color: Colors.black),
    ),
    Text(
      'Settings',
      style: TextStyle(color: Colors.black),
    ),
  ];

  var currentIndex = 0;

  changeIndex(index)
  {
    print(index);

    currentIndex = index;

    print(currentIndex);
    emit(HomeStateIndex());
  }

  setData()
  {
    userName = getUsername();
    avatar = getAvatar();
    print('user data');
    emit(HomeStateData());
  }
}