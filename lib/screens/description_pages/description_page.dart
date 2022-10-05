import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';
import 'package:order_web_app/models/foods.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key, required this.index}) : super(key: key);
  final ContextModel index;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white70.withOpacity(0.5),
        elevation: 10,
        title: Column(
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.close)),
                SizedBox(
                  width: bigPading,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    index.name,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
            SizedBox(height: smallPading),
            SizedBox(
              height: 150,
              width: 200,
              child: Image.asset(index.img),
            ),
            Text('Description', style: Theme.of(context).textTheme.headline3),
            SizedBox(height: smallPading),
            Container(
              height: 1,
              color: Colors.black,
            ),
            SizedBox(height: smallPading),
            Text(
              index.description,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ],
        ));
  }
}
