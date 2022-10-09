import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';
import 'package:order_web_app/models/model.dart';
import 'package:order_web_app/providers/background_provider.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key, required this.item}) : super(key: key);
  final ContextModel item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Gradient changedGradient =
        Provider.of<BackgraoundProvider>(context).changeBackGround;
    return Container(
        decoration: BoxDecoration(
          gradient: changedGradient,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(alignment: Alignment.center, children: [
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
                height: size.height / 1.9,
                width: size.width / 1.3,
                decoration: BoxDecoration(
                    gradient: changedGradient,
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    SizedBox(
                      height: smallPading,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: smallPading,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.close)),
                        SizedBox(
                          width: bigPading,
                        ),
                        SizedBox(
                          width: 170,
                          child: Text(
                            item.name,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(),
                          ),
                        ),
                      ],
                    ),
                    Hero(
                      tag: 'tag${item.img}',
                      child: Image.asset(
                        item.img,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Text('Description',
                        style: Theme.of(context).textTheme.headline3),
                    SizedBox(height: smallPading),
                    Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    SizedBox(height: smallPading),
                    Text(
                      item.description,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.brown.shade900),
                    ),
                  ],
                ))
          ]),
        ));
  }
}
