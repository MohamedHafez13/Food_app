import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/modules/login/login_cubit.dart';
import 'package:food_app/modules/register/register_screen.dart';
import 'package:food_app/shared/component/components.dart';

import 'login_states.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (BuildContext context,  state) {
          // if(state is LoginErrorState){
          //   showToast(text: state.error, toastColor: Colors.red);
          // }else if (state is LoginSuccessState )
          // {
          //   Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => MyHomePage()));
          // }
        },
        builder: (BuildContext context, state) {
          return  Scaffold(
            appBar: AppBar(
              title: Text("Login"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        defaultTextForm(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            hintText: "Email Address",
                            labelText: "Email",
                            prefixIcon: Icons.email,
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter Your Email";
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        defaultTextForm(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            isPassword: LoginCubit.get(context).obscureText,
                            hintText: "Password",
                            labelText: "Password",
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: LoginCubit.get(context).iconData,
                            suffixIconFunction: (){
                              LoginCubit.get(context).changePasswordVisibilityIcon();
                            },
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter Your Password";
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        defaultButton(
                            width: double.infinity,
                            backGroundColor: Colors.blueAccent,
                            label: "Login",
                            labelColor: Colors.white,
                            onPress: () {
                              if (formKey.currentState != null &&
                                  formKey.currentState!.validate()) {

                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );

                              }
                            }
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account ?",
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 22,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                              },
                              child: Text(
                                "Register now",
                                style:
                                TextStyle(color: Colors.blueAccent, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}