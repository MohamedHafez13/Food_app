import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/layout/home_cubit/home%20states.dart';
import 'package:food_app/modules/categories/categories_screen.dart';
import 'package:food_app/modules/home/home.dart';
import 'package:food_app/modules/user_profile/profile_screen.dart';
import 'package:image_picker/image_picker.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int istapped = -1;

  List<Widget> pages = [
    Home(),
    CategoriesScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeNavigationBarState());
  }

  List<String> containersLabel = [
    "FAVORITE",
    "PHOTOS",
    "REVIEWS",
    "YUMS",
  ];
 List<String> labelsOfHomeContainers=[
   "Live Tracking",
   "Online Payment",
   "Offers",
   "Accept Promo",
 ];
 List <Color> homeIconsColor=[
   Colors.amber,
   Colors.green,
   Colors.purple,
   Colors.red,
 ];

 List<String> imageSlider=[
   "assets/images/1.jpeg",
   "assets/images/2.jpeg",
   "assets/images/3.jpeg",
   "assets/images/4.jpeg",
   "assets/images/5.jpeg",
 ];
  List<String> offersList=[
    "assets/images/pizza.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
    "assets/images/5.jpeg",
  ];
  List<String> restaurants=[
    "Domino's Pizza",
    "Steakanji",
    "Passta",
    "Volks Candy",
    "Butcher",
  ];

  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource scr) async {
    final _pickedFile = await picker.pickImage(source: scr);
    if (_pickedFile != null) {
      _image = File(_pickedFile.path);
    }
  }



}
