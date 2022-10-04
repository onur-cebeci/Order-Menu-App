import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';
import 'package:order_web_app/models/model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: backgroundGradient,
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              CustomAppBarWidget(size: size),
              SizedBox(
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
                                text: ' FOOD',
                              ),
                              ListView.builder(
                                itemCount: foodList.length,
                                itemBuilder: (context, index) {
                                  return Container();
                                },
                              ),
                            ],
                          ),

                          /*
                          CustomTabMenu(
                            size: size,
                            image:
                                'https://images.pexels.com/photos/12821521/pexels-photo-12821521.jpeg?auto=compress&cs=tinysrgb&w=1600',
                            text: 'COFFEE',
                          ),
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
            width: size.width - 10,
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
            top: (size.height / 8) / 2,
            left: (size.width / 3.2) / 13,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 30, color: Colors.white70),
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
          Spacer(),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              gradient: backgroundGradient,
              borderRadius: BorderRadius.circular(120),
            ),
          ),
          SizedBox(width: 5),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              gradient: oceanBackgroundGradient,
              borderRadius: BorderRadius.circular(120),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              gradient: almostBackgroundGradient,
              borderRadius: BorderRadius.circular(120),
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
