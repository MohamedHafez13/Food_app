import 'package:flutter/material.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/shared/component/components.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Categories",style: TextStyle(color: Colors.black),),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => buildInkWell(
          CategoriesItem(
            'assets/images/restaurant.jpg',
            "Restaurant",
            () {},
          ),
        ),
      ),
    );
  }
}
