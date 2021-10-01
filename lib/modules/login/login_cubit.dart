import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_states.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  IconData iconData = Icons.visibility_off_outlined;
  bool obscureText = true ;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value)async {

      setUId();
      emit(LoginSuccessState());


    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }



  void setUId()async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    preferences.setString('uid',"${FirebaseAuth.instance.currentUser!.uid}" );
    // emit(LoginSaveUid());
  }

  void changePasswordVisibilityIcon()
  {
    obscureText = !obscureText;
    iconData = obscureText? Icons.visibility_off_outlined:Icons.remove_red_eye;
    emit(ChangePasswordVisibility());
  }
}
