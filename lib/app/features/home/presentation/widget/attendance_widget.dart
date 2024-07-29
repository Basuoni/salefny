import 'package:salefny/app/core/extensions/media_query_value.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import 'attendances_containers.dart';

class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.03,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: kcWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                tr.attendance,
                style: context.medium16Black,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 17,
              ),
              const Width(12),
            ],
          ),
          Text(
            tr.summary,
            style: context.medium16TextSub,
          ),
          const Height(25),
          const Row(
            children: [
              Expanded(
                child: AttendancesContain(
                  textTitle: 'Early Leaves',
                  numberTitle: '02',
                  color: kcSuccess,
                  lightColor: kcSuccessLight,
                ),
              ),
              Width(12),
              Expanded(
                child: AttendancesContain(
                  textTitle: 'Absent',
                  numberTitle: '05',
                  color: kcDanger,
                  lightColor: kcDangerLight,
                ),
              ),
            ],
          ),
          const Height(25),
          const Row(
            children: [
              Expanded(
                child: AttendancesContain(
                  textTitle: 'Late in',
                  numberTitle: '03',
                  color: kcWarning,
                  lightColor: kcWarningLight,
                ),
              ),
              Width(10),
              Expanded(
                child: AttendancesContain(
                  textTitle: 'Leaves',
                  numberTitle: '04',
                  color: kcPrimaryColor,
                  lightColor: kcPrimaryLight,
                ),
              ),
            ],
          ),
          const Height(10),
        ],
      ),
    );
  }
}
