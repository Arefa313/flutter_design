import 'package:flutter/material.dart';
import 'package:flutter_ds_demo/custom/BorderBox.dart';
import 'package:flutter_ds_demo/custom/OptionButton.dart';
import 'package:flutter_ds_demo/utils/constants.dart';
import 'package:flutter_ds_demo/utils/custom_functions.dart';
import 'package:flutter_ds_demo/utils/sample_data.dart';
import 'package:flutter_ds_demo/utils/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = rd .git /S/Q Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderBox(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.menu),
                        ),
                        BorderBox(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "City",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "San francisco",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Padding(
                      padding: sidePadding,
                      child: Divider(
                        color: COLOR_GREY,
                        height: 25,
                      )),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ["<\$220,000", "for sale", "3-4 beds", ">1000 sqft"]
                          .map((filter) => ChoiceOption(text: filter))
                          .toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return RealEstateItem(itemData: RE_DATA[index]);
                          }),
                    ),
                  ),
                ],

              ),
              Positioned(
                bottom: 20,
                width: size.width,
                  child: Center(
                    child: OptionButton(
               icon: Icons.map_rounded,
                text: "Map View",
                width: size.width*0.35,

              ),
                  )),
            ],

          ),

        ),

      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;
  const ChoiceOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;
  const RealEstateItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(itemData["image"])),
              Positioned(
                top: 15,
                right: 15,
                child: BorderBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.favorite_border,
                    color: COLOR_BLACK,
                  ),
                ),
              ),
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                "${formatCurrency(itemData["amount"])}",
                style: themeData.textTheme.headline1,
              ),
              addHorizentalSpace(10),
              Text(
                "${itemData["address"]}",
                style: themeData.textTheme.bodyText2,
              ),
              Text(
                "${itemData["bedrooms"]} bedrooms/${itemData["bathrooms"]} bathrooms/ ${itemData["area"]} sqft",
                style: themeData.textTheme.headline5,
              )
            ],
          )
        ],
      ),
    );
  }
}
