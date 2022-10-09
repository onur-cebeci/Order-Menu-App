import 'package:flutter/material.dart';
import 'package:order_web_app/constant.dart';
import 'package:order_web_app/providers/background_provider.dart';
import 'package:order_web_app/providers/icon_button_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    int value =
        Provider.of<BackgraoundProvider>(context, listen: true).borderValue;

    return Container(
        width: widget.size.width,
        height: 100,
        color: Colors.black.withOpacity(0.3),
        child: Column(
          children: [
            SizedBox(height: smallPading),
            Row(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Provider.of<IconButtonProvider>(context, listen: false)
                          .changeList(_animationController);
                    });
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.list_view,
                    progress: _animationController,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  width: mediumPading,
                )
              ],
            )
          ],
        ));
  }
}
