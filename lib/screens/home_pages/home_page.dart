import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';
import 'package:order_web_app/models/model.dart';
import 'package:order_web_app/providers/background_provider.dart';
import 'package:order_web_app/providers/icon_button_provider.dart';
import 'package:order_web_app/screens/home_pages/custom_model_list_pageview.dart';
import 'package:order_web_app/witgets/custom_app_bar_widget.dart';
import 'package:order_web_app/witgets/custom_container_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gradient changedGradient =
        Provider.of<BackgraoundProvider>(context).changeBackGround;
    bool changeList = Provider.of<IconButtonProvider>(context).changeIcon;
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
                  child: ListviewPageBody(size: size),
                ),
              ),
            ],
          )),
    );
  }
}

class ListviewPageBody extends StatelessWidget {
  const ListviewPageBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainerTile(
          size: size,
          image:
              'https://images.pexels.com/photos/1565982/pexels-photo-1565982.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          text: '  FOOD',
        ),
        const CustomlistView(),
        CustomContainerTile(
          size: size,
          image:
              'https://images.pexels.com/photos/12821521/pexels-photo-12821521.jpeg?auto=compress&cs=tinysrgb&w=1600',
          text: 'COFFEE',
        ),
        const CustomlistView(),
      ],
    );
  }
}

class CustomlistView extends StatelessWidget {
  const CustomlistView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: Expanded(
          child: ListView.builder(
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              final item = foodList[index];
              return Container(
                  padding: EdgeInsets.only(bottom: smallPading),
                  height: 100,
                  color: Colors.transparent,
                  child: ListTile(
                      title: Text(item.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith()),
                      subtitle: Text(
                        '\$${item.value.toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 16, color: Colors.white38),
                      ),
                      tileColor: darkSecondColor.withOpacity(0.5),
                      leading: SizedBox(
                        height: 100,
                        width: 80,
                        child: Image.asset(
                          item.img,
                          fit: BoxFit.cover,
                        ),
                      )));
            },
          ),
        ));
  }
}

class Pageview_body extends StatelessWidget {
  const Pageview_body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            CustomContainerTile(
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
            CustomContainerTile(
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
      ],
    );
  }
}
