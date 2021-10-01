import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/layout/home_cubit/home-cubit.dart';
import 'home_cubit/home states.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: HomeCubit.get(context).currentIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              onTap: (index) {
                HomeCubit.get(context).changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: "Categories",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity),
                  label: "Me",
                )
              ],
            ),
            body: HomeCubit.get(context).pages[HomeCubit.get(context).currentIndex],
          );
        },
      ),
    );
  }
}
