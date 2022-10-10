import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';
import 'package:order_web_app/screens/description_pages/description_page.dart';

class CustomlistViewWidget extends StatelessWidget {
  const CustomlistViewWidget({
    Key? key,
    required this.list,
    required this.listLenght,
    required this.boxFit,
  }) : super(key: key);
  final int listLenght;
  final List list;
  final BoxFit boxFit;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 480,
      child: ListView.builder(
        itemCount: listLenght,
        itemBuilder: (context, index) {
          final item = list[index];
          return Container(
              padding: EdgeInsets.only(bottom: smallPading),
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DescriptionPage(item: item)));
                },
                child: ListTile(
                    shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                    title: Text(item.name,
                        style:
                            Theme.of(context).textTheme.headline4!.copyWith()),
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
                        fit: boxFit,
                      ),
                    )),
              ));
        },
      ),
    );
  }
}
