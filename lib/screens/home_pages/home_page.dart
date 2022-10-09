import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';
import 'package:order_web_app/models/model.dart';
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

class CustomModelList extends StatefulWidget {
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
  State<CustomModelList> createState() => _CustomModelListState();
}

class _CustomModelListState extends State<CustomModelList> {
  double viewportFraction = 0.7;
  PageController pageController = PageController();
  late double pageOffset = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
        keepPage: false, viewportFraction: viewportFraction, initialPage: 2)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: widget.size.width,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 16,
                color: Colors.black,
                spreadRadius: 0.2,
                blurStyle: BlurStyle.outer),
          ],
        ),
        child: PageView.builder(
          controller: pageController,
          physics: const PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.listLenght,
          itemBuilder: (context, index) {
            final item = widget.list[index];

            double scale = max(viewportFraction,
                (1 - (pageOffset - index).abs()) + viewportFraction);

            double pageOpacity = (pageOffset - index).abs();
            print(pageOpacity.toString());

            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DescriptionPage(item: item)));
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(item.img), fit: BoxFit.cover),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15,
                        sigmaY: 15,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 70 - scale * 40),
                      height: 250,
                      width: widget.size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: -90,
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 30,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(0, widget.offsetSize)),
                        ],
                      ),
                      child: Hero(
                        tag: 'tag${item.img}',
                        child: Image.asset(
                          item.img,
                          fit: BoxFit.contain,
                        ),
                      )),
                  Positioned(
                      bottom: -20,
                      left: (widget.size.width) / 14,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: pageOpacity == 1
                            ? pageOpacity == 0
                                ? 1
                                : 0
                            : 1,
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
                    top: 10,
                    right: 10,
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
          height: size.height / 9,
          width: size.width,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.elliptical(20, 10))),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            top: (size.height / 9) / 4,
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
