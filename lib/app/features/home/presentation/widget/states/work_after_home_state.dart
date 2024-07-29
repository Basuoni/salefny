import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/widgets/buttons/custom_button.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/features/home/presentation/controller/home_provider.dart';
import 'package:salefny/app/features/home/presentation/widget/row_times.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkAfterHomeState extends ConsumerWidget {
  const WorkAfterHomeState({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(homeProvider);
    return Column(
      children: [
        Text(
          '01:36:01',
          style: context.medium32Black,
        ),
        Text(
          'May 13, 2024 - Monday',
          style: context.regular14TextSub,
        ),
        const Height(20),
        CustomButtonOutlined(
          onPress: provider.setCheckedOutState,
          title: 'Check out',
        ),
        const RowTimes(),
      ],
    );
  }
}
