import 'package:discy_demo/layouts/cubit/cubit.dart';
import 'package:discy_demo/layouts/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state)
      {

      },
      builder: (context, state)
      {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            elevation: 5.0,
            title: HomeCubit.get(context).titles[HomeCubit.get(context).currentIndex],
            iconTheme: IconThemeData(
              color: Colors.black54,
            ),
          ),
          drawer: Drawer(),
          body: HomeCubit.get(context).widgets[HomeCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.grid_on,
                  ),
                  label: 'Categories'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  label: 'Favourites'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Settings'
              ),
            ],
            type: BottomNavigationBarType.fixed,
            onTap: (index)
            {
              HomeCubit.get(context).changeIndex(index);
            },
            currentIndex: HomeCubit.get(context).currentIndex,
          ),
        );
      },
    );
  }
}
