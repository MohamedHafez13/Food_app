import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/layout/home_cubit/home%20states.dart';
import 'package:food_app/layout/home_cubit/home-cubit.dart';
import 'package:food_app/shared/component/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_app/shared/style/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Widget reviewContainer({required int count, required String label}) {
    return Container(
      child: Column(
        children: [
          Text(
            "$count",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget verticalDivider() {
    return Container(
      height: 30,
      width: 2,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
       var   cubit = HomeCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                            cubit.getImage (ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[400],
                              radius: 50,
                              child: Icon(
                                Icons.person_add_alt,
                                size: 40,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "mohammed hafez",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "0.00 EGP ",
                                style: coloredText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      reviewContainer(count: 0, label: "Reviews"),
                      verticalDivider(),
                      reviewContainer(count: 0, label: "Followers"),
                      verticalDivider(),
                      reviewContainer(count: 0, label: "Following"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 20, 10),
                        child: defaultButton(
                          width: MediaQuery.of(context).size.width / 2,
                          label: "Edit Profile",
                          labelColor: Colors.red,
                          onPress: () {},
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width / 3,
                        child: MaterialButton(
                          child: Icon(
                            Icons.settings,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            cubit.containersLabel.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: defaultButton(
                            backGroundColor:cubit.istapped==index?
                            Colors.red[400]:Colors.grey[300],
                            label:
                                cubit.containersLabel[index],
                            labelColor: Colors.white,
                            onPress: () {
                              setState(() {
                               cubit. istapped= index;
                              });
                            },
                            radius: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
