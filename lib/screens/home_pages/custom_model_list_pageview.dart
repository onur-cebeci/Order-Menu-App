import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:order_web_app/screens/description_pages/description_page.dart';

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
                        opacity: pageOpacity == 0 ? 1 : 0,
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
