import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:order_web_app/providers/background_provider.dart';
import 'package:order_web_app/providers/icon_button_provider.dart';
import 'package:order_web_app/screens/home_pages/listview_design_pages/custom_model_list_listview_page.dart';
import 'package:order_web_app/screens/home_pages/pageview_design_pages/pageview_body_page.dart';
import 'package:order_web_app/witgets/custom_app_bar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gradient changedGradient =
        Provider.of<BackgraoundProvider>(context).changeBackGround;
    bool changeScreens = Provider.of<IconButtonProvider>(context).changeIcon;
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
              changeScreens ? const PageviewBody() : const ListDesingPage(),
            ],
          )),
    );
  }
}
