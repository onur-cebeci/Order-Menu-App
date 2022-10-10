import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';
import 'package:order_web_app/models/model.dart';
import 'package:order_web_app/screens/home_pages/pageview_design_pages/custom_model_list_pageview.dart';
import 'package:order_web_app/witgets/custom_container_tile.dart';

class PageviewBody extends StatelessWidget {
  const PageviewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 100,
      child: SingleChildScrollView(
          child: Column(
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
      )),
    );
  }
}
