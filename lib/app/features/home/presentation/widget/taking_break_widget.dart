import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/widgets/buttons/custom_button.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/features/home/presentation/widget/row_times.dart';
import 'package:salefny/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TakingBreakWidget extends StatelessWidget {
  const TakingBreakWidget({super.key, required this.endTap});

  final void Function() endTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("It's Your Break Time!", style: context.regular14Black),
        SvgPicture.asset(
          Assets.svgTakeBreak,
        ),
        const Height(5),
        Text(
          '00:13:05',
          style: context.medium32Black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your break time start from',
              style: context.regular12TextSub,
            ),
            const Width(5),
            Text('02:35 PM', style: context.regular12Black),
          ],
        ),
        const Height(12),
        CustomButton(
          title: 'End',
          titleColor: AppColors.danger,
          buttonColor: AppColors.dangerLight,
          onPress: endTap,
        ),
        const RowTimes(),
      ],
    );
  }
}
