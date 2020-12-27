import 'package:conditional_builder/conditional_builder.dart';
import 'package:discy_demo/modules/single_category/cubit/cubit.dart';
import 'package:discy_demo/modules/single_category/cubit/states.dart';
import 'package:discy_demo/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCategoryScreen extends StatelessWidget {
  String title;
  int id;

  SingleCategoryScreen({@required this.title, @required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SingleCategoryCubit()..getSingleCategory(id),
      child: BlocConsumer<SingleCategoryCubit, SingleCategoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = SingleCategoryCubit.get(context).questions;

          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: ConditionalBuilder(
              condition: state is! SingleCategoryStateLoading,
              builder: (context) => listOfQuestions(
                list: list,
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
