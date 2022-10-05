import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';
import 'package:order_web_app/models/foods.dart';
import 'package:order_web_app/providers/background_provider.dart';
import 'package:order_web_app/screens/description_pages/description_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gradient changedGradient =
        Provider.of<BackgraoundProvider>(context).changeBackGround;
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: changedGradient,
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              CustomAppBarWidget(
                size: size,
              ),
              SizedBox(
                height: size.height - 100,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: smallPading),
                          Column(
                            children: [
                              CustomTabMenu(
                                size: size,
                                image:
                                    'https://images.pexels.com/photos/1565982/pexels-photo-1565982.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                text: '  FOOD',
                              ),
                              SizedBox(height: mediumPading),
                              CustomModelList(
                                  offsetSize: 45,
                                  size: size,
                                  listLenght: foodList.length,
                                  list: foodList),
                              SizedBox(height: mediumPading),
                              CustomTabMenu(
                                size: size,
                                image:
                                    'https://images.pexels.com/photos/12821521/pexels-photo-12821521.jpeg?auto=compress&cs=tinysrgb&w=1600',
                                text: 'COFFEE',
                              ),
                              SizedBox(height: mediumPading),
                              CustomModelList(
                                  offsetSize: 95,
                                  size: size,
                                  listLenght: coffeesList.length,
                                  list: coffeesList),
                              SizedBox(height: mediumPading),
                            ],
                          ),

                          /*

                          CustomTabMenu(
                            size: size,
                            image:
                                'https://images.pexels.com/photos/1904262/pexels-photo-1904262.jpeg?auto=compress&cs=tinysrgb&w=1600',
                            text: ' DRINK',
                          ),
                      */
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class CustomModelList extends StatelessWidget {
  const CustomModelList({
    Key? key,
    required this.size,
    required this.listLenght,
    required this.list,
    required this.offsetSize,
  }) : super(key: key);

  final Size size;
  final int listLenght;
  final List list;
  final double offsetSize;

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(keepPage: false, viewportFraction: 0.6, initialPage: 2);
    return SizedBox(
        height: 275,
        width: size.width,
        child: PageView.builder(
          controller: pageController,
          physics: const PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: listLenght,
          itemBuilder: (context, index) {
            final item = list[index];
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onLongPress: () {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (_) => DescriptionPage(index: item));
              },
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    width: size.width,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: -90,
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 30,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(0, offsetSize)),
                      ],
                    ),
                    child: Image.asset(
                      item.img,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                      bottom: -20,
                      left: size.width / 28,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: list[index].name != item.name ? 0.3 : 1.0,
                        child: SizedBox(
                          height: 100,
                          width: 220,
                          child: Text(
                            item.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 24),
                          ),
                        ),
                      )),
                  Positioned(
                    right: 5,
                    child: Text(
                      '\$${item.value.toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  pageChanged() {}
}

class CustomTabMenu extends StatelessWidget {
  const CustomTabMenu({
    Key? key,
    required this.size,
    required this.image,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: size.height / 6.5,
            width: size.width,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.elliptical(20, 10))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.elliptical(20, 10)),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: size.height / 6.5,
          width: size.width / 3.2,
          color: Colors.black.withOpacity(0.1),
        ),
        Positioned(
            top: (size.height / 8) / 2.5,
            left: size.width / 3.5,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.white70),
            )),
      ],
    );
  }
}

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    int value =
        Provider.of<BackgraoundProvider>(context, listen: true).borderValue;
    return Container(
      width: size.width,
      height: 100,
      color: Colors.black.withOpacity(0.3),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(
            left: smallPading,
          )),
          SizedBox(
            width: 110,
            child: Image.asset(
              'assets/logo.png',
              color: Colors.white38,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Provider.of<BackgraoundProvider>(context, listen: false)
                  .changeBackGroundGradient(0);
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: value == 0
                    ? Border.all(color: Colors.white, width: 2)
                    : null,
                gradient: darkBackgroundGradient,
                borderRadius: BorderRadius.circular(120),
              ),
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              Provider.of<BackgraoundProvider>(context, listen: false)
                  .changeBackGroundGradient(1);
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: value == 1
                    ? Border.all(color: Colors.white, width: 2)
                    : null,
                gradient: oceanBackgroundGradient,
                borderRadius: BorderRadius.circular(120),
              ),
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              Provider.of<BackgraoundProvider>(context, listen: false)
                  .changeBackGroundGradient(2);
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: value == 2
                    ? Border.all(color: Colors.white, width: 2)
                    : null,
                gradient: almostBackgroundGradient,
                borderRadius: BorderRadius.circular(120),
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
