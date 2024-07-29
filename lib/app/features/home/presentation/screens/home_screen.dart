import 'package:salefny/app/core/extensions/media_query_value.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/app/core/widgets/app_bar/no_app_bar.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/core/widgets/padding/custom_padding.dart';
import 'package:salefny/app/features/home/presentation/controller/home_provider.dart';
import 'package:salefny/app/features/home/presentation/screens/work_type_selecter_view.dart';
import 'package:salefny/app/features/home/presentation/widget/attendance_widget.dart';
import 'package:salefny/app/features/home/presentation/widget/home_top.dart';
import 'package:salefny/app/features/home/presentation/widget/states/break_in_work_state.dart';
import 'package:salefny/app/features/home/presentation/widget/states/checked_home_state.dart';
import 'package:salefny/app/features/home/presentation/widget/states/initial_home_state.dart';
import 'package:salefny/app/features/home/presentation/widget/states/work_after_home_state.dart';
import 'package:salefny/app/features/home/presentation/widget/states/work_before_break_home_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return Scaffold(
      appBar: const NoAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HomeTop(),
            Padding(
              padding: CustomPadding.smallPadding(context),
              child: Column(
                children: [
                  const Height(120),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.03,
                      vertical: 10,
                    ), // Adjust the padding as needed
                    decoration: BoxDecoration(
                      color: kcWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: context.width,
                    child: Column(
                      children: [
                        const WorkTypeSelectorView(),
                        const Height(10),
                        Consumer(
                          builder: (context, ref, child) {
                            final bordState =
                                ref.watch(provider.bordState.provider);
                            if (bordState.isInitial) {
                              return const InitialHomeState();
                            } else if (bordState.isWorkBeforeBreak) {
                              return const WorkBeforeBreakHomeState();
                            } else if (bordState.isBreakInWork) {
                              return const BreakInWorkState();
                            } else if (bordState.isWorkAfterBreak) {
                              return const WorkAfterHomeState();
                            } else {
                              return const CheckedHomeState();
                            }
                          },
                        ),
                        const Height(12),
                      ],
                    ),
                  ),
                  const AttendanceWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
