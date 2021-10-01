import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/layout/my_home_page.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/modules/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late UserModel model;
  String userId ="";

  Future getUid()async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    var id = preferences.getString('uid');
    if(id != null){
      userId =id;
    }
  }
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      getUid().whenComplete(() async {
        userId.isEmpty
            ? Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()))
            : Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyHomePage()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(),);
  }
}
