import 'package:discy_demo/layouts/cubit/cubit.dart';
import 'package:discy_demo/layouts/home_screen.dart';
import 'package:discy_demo/shared/components/components.dart';
import 'package:discy_demo/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await initPref();

  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    DioHelper();

    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context)
        {
          HomeCubit.get(context).setData();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}