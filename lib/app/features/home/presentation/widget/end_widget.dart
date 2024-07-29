import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/features/home/presentation/widget/row_times.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/assets.dart';

class EndWidget extends StatelessWidget {
  const EndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'The End Of The Day!',
          style: context.medium14Black,
        ),
        SvgPicture.asset(
          Assets.svgEnd,
        ),
        const Height(5),
        Text(
          '08:01:50',
          style: context.medium32Black,
        ),
        Text(
          'May 13, 2024 - Monday',
          style: context.regular12TextSub,
        ),
        const RowTimes(
          checkOutTime: '04:06 AM',
        ),
      ],
    );
  }
}
