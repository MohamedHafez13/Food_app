import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/layout/home_cubit/home%20states.dart';
import 'package:food_app/layout/home_cubit/home-cubit.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/shared/component/icons.dart';
import 'package:food_app/shared/style/style.dart';
import 'package:food_app/shared/component/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();

  Widget searchContainer() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(IconBroken.Search),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Find a Restaurant or Dish ",
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSlider({required int count, required List<String> imagePath}) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: count,
        itemBuilder: (BuildContext context, int index, int realIndex) =>
            Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            imagePath[index],
            fit: BoxFit.cover,
          ),
        ),
        options: CarouselOptions(
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Row(
                          children: [
                            Image(
                              height: 20,
                              width: 20,
                              image: AssetImage('assets/images/R.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Deliver",
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(IconBroken.Arrow___Right_Square),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              "Your Address",
                              style: coloredText,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(IconBroken.Notification),
                              color: Colors.grey[600],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        searchContainer(),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              //   padding: EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                IconBroken.Filter,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) => homeContainer(
                          color: HomeCubit.get(context).homeIconsColor[index],
                          label: HomeCubit.get(context)
                              .labelsOfHomeContainers[index],
                          context: context,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          buildSlider(
                            count: HomeCubit.get(context).imageSlider.length,
                            imagePath: HomeCubit.get(context).imageSlider,
                          ),
                          Center(
                            child: AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: HomeCubit.get(context).imageSlider.length,
                              effect: JumpingDotEffect(
                                activeDotColor: Colors.red,
                                radius: 10,
                                dotWidth: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            "Offers",
                            style: TextStyle(fontSize: 25),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See All",
                              style: coloredText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // offerContainer(context),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: HomeCubit.get(context).offersList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => itemContainer(
                            context,
                            ItemModel(
                                HomeCubit.get(context).offersList[index],
                                "assets/images/Dominos.png",
                                HomeCubit.get(context).restaurants[index],
                                100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
