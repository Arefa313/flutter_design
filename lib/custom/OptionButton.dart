import 'package:flutter/material.dart';
import 'package:flutter_ds_demo/utils/constants.dart';
import 'package:flutter_ds_demo/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton(
      {super.key, required this.text, required this.icon, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
        onPressed: () {},
        splashColor: COLOR_WHITE.withAlpha(55),
        child: Row(
          children: [
            Icon(
              icon,
              color: COLOR_WHITE,
            ),
            addHorizentalSpace(10),
            Text(
              text,
              style: TextStyle(color: COLOR_WHITE),
            )
          ],
        ),
        color: COLOR_DARK_BLUE,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
