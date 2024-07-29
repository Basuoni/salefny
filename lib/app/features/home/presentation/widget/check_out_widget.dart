import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/features/home/presentation/widget/row_times.dart';
import 'package:flutter/material.dart';
import 'package:salefny/app/core/widgets/buttons/custom_attendance_widget.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({super.key, this.endTap});
  final void Function() ? endTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text( '08:01:50',style: context.medium32Black,),
        Text(  'May 13, 2024 - Monday',style: context.regular14TextSub,),
        const Height(40),
        CustomAttendanceButton(
          isSecondary: true,
          onTap: endTap,
          text: 'Check out',
        ),
        const RowTimes(),
      ],
    );
  }
}



