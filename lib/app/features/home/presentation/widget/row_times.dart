import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../generated/assets.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/padding/custom_padding.dart';
import 'column_checking.dart';

class RowTimes extends StatelessWidget {
  const RowTimes({super.key, this.checkOutTime = "-------"});
  final String checkOutTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Divider(
            color: kcBorderColor,
          ),
        ),
        Padding(
          padding: CustomPadding.smallPadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColumnChecking(
                widget:SvgPicture.asset( Assets.svgClock1),
                title: "08:05 AM",
                subText: 'Check in',
              ),
              Container(
                width: 2,
                height: 30,
                color: kcBorderColor,
              ),
              ColumnChecking(
                widget:SvgPicture.asset( Assets.svgClock2),
                title: checkOutTime,
                subText: 'Check Out',
              ),
              Container(
                width: 2,
                height: 30,
                color: kcBorderColor,
              ),
              ColumnChecking(
                widget: SvgPicture.asset( Assets.svgClock),
                title: "1h 36m",
                subText: 'Total Hrs',
              ),
            ],
          ),
        )
      ],
    );
  }
}
