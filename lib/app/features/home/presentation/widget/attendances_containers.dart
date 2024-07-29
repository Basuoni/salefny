import 'package:salefny/app/core/extensions/media_query_value.dart';
import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';

class AttendancesContain extends StatelessWidget {
  final Color color;
  final Color lightColor;
  final String numberTitle;
  final String textTitle;

  const AttendancesContain(
      {super.key, this.color = kcWhiteColor, this.lightColor = kcWhiteColor, required this.textTitle, required this.numberTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.topCenter,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          top: 2,
          child: Container(
            padding: EdgeInsets.all(10),
            width: context.width* 0.43,
            height: 100,
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  numberTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  textTitle,
                  style: TextStyle(color: color, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
