import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/modules/splash_screen/splash_screen.dart';
import 'package:food_app/shared/observer.dart';
import 'layout/my_home_page.dart';
import 'modules/home/home.dart';
import 'modules/user_profile/profile_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

    Bloc.observer = MyBlocObserver();
    // Use cubits...

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: SplashScreen(),
    );
  }
}

