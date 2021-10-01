import 'package:flutter/material.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/shared/component/icons.dart';
Widget defaultTextForm({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? suffixIconFunction,
  FormFieldValidator<String>? validation,
  GestureTapCallback? onTap,
  required TextInputType type,
  bool isPassword = false,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: IconButton(
        icon: Icon(prefixIcon),
        onPressed: () {},
      ),
      suffixIcon: IconButton(
        icon: Icon(suffixIcon),
        onPressed: suffixIconFunction,
      ),
    ),
    validator: validation,
    onTap: onTap,
    obscureText: isPassword,
  );
}

Widget defaultButton({
  double? width,
  Color? backGroundColor = Colors.white,
  required String label,
  required Color labelColor,
  required VoidCallback onPress,
  double? radius = 10,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius!),
      border: Border.all(color: Colors.grey, width: 1),
      color: backGroundColor,
    ),
    width: width,
    child: MaterialButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: labelColor,
          ),
        ),
        onPressed: onPress),
  );
}

Widget homeContainer(
    {required BuildContext context,
    required String label,
    required Color color}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.all(5.0),
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 2.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Icon(
            IconBroken.Location,
            size: 30,
            color: color,
          ),
          Spacer(),
          Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ],
      ),
    ),
  );
}

Widget itemContainer(context,ItemModel item) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height / 2.6,
      width: MediaQuery.of(context).size.width-70,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(item.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height / 8.6,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image(
                          height: 20,
                          width: 20,
                          image: AssetImage(item.logoPath),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          item.restaurantName,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 5),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "% Meal for Four ${item.price} LE",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
Widget buildInkWell(CategoriesItem categoriesItem) {
  return Builder(builder: (BuildContext context)=>InkWell(
    onTap:categoriesItem.yourNavigation,
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(categoriesItem.imageName),
            ),
          ),
        ),
        Text(
          categoriesItem.categoryName,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  ),
  );
}