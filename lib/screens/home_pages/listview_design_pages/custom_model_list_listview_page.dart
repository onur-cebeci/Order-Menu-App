import 'package:flutter/material.dart';
import 'package:order_web_app/models/model.dart';
import 'package:order_web_app/providers/background_provider.dart';
import 'package:order_web_app/screens/home_pages/listview_design_pages/custom_listview_widget.dart';
import 'package:order_web_app/witgets/custom_container_tile.dart';
import 'package:provider/provider.dart';

class ListDesingPage extends StatelessWidget {
  const ListDesingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    Size size = MediaQuery.of(context).size;
    return Expanded(
        child: PageView(
      controller: _pageController,
      children: [
        CustomListDesignPageviewBodyFirst(
            size: size, pageController: _pageController),
        CustomListDesignPageviewBodySecond(
            size: size, pageController: _pageController),
      ],
    ));
  }
}

class CustomListDesignPageviewBodyFirst extends StatelessWidget {
  const CustomListDesignPageviewBodyFirst({
    Key? key,
    required this.size,
    required this.pageController,
  }) : super(key: key);

  final Size size;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    Color primaryColor =
        Provider.of<BackgraoundProvider>(context, listen: true).primaryColor;
    return Column(
      children: [
        CustomContainerTile(
          size: size,
          image:
              'https://images.pexels.com/photos/1565982/pexels-photo-1565982.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          text: '  FOOD',
        ),
        CustomlistViewWidget(
          listLenght: foodList.length,
          list: foodList,
          boxFit: BoxFit.cover,
        ),
        Expanded(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    pageController.jumpToPage(0);
                  },
                  child: Container(
                    height: 40,
                    child: Image.asset(
                      'assets/food_icon.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pageController.jumpToPage(1);
                  },
                  child: Container(
                    height: 40,
                    child: Image.asset(
                      'assets/coffee_icon.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomListDesignPageviewBodySecond extends StatelessWidget {
  const CustomListDesignPageviewBodySecond({
    Key? key,
    required this.size,
    required this.pageController,
  }) : super(key: key);

  final Size size;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    Color primaryColor =
        Provider.of<BackgraoundProvider>(context, listen: false).primaryColor;
    return Column(
      children: [
        CustomContainerTile(
          size: size,
          image:
              'https://images.pexels.com/photos/12821521/pexels-photo-12821521.jpeg?auto=compress&cs=tinysrgb&w=1600',
          text: 'COFFEE',
        ),
        CustomlistViewWidget(
          listLenght: coffeesList.length,
          list: coffeesList,
          boxFit: BoxFit.fitHeight,
        ),
        Expanded(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    pageController.jumpToPage(0);
                  },
                  child: Container(
                    height: 40,
                    child: Image.asset(
                      'assets/food_icon.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pageController.jumpToPage(1);
                  },
                  child: Container(
                    height: 40,
                    child: Image.asset(
                      'assets/coffee_icon.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
