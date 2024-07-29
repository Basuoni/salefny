import 'package:salefny/app/core/enums/work_type.dart';
import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/app/features/home/presentation/controller/home_provider.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkTypeSelectorView extends ConsumerWidget {
  const WorkTypeSelectorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    final workType = ref.watch(provider.workType.provider);
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              'Work Type',
              style: context.medium14Black,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(22),
            ),
            height: 50,
            child: Row(
              children: [
                _WorkTypeButton(
                  title: tr.home,
                  iconPath: Assets.svgHome,
                  isSelected: workType.isFromHome,
                  onPress: () => provider.setWorkType(WorkType.fromHome),
                ),
                _WorkTypeButton(
                  title: tr.office,
                  iconPath: Assets.svgBuildings,
                  isSelected: workType.isOffice,
                  onPress: () => provider.setWorkType(WorkType.office),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkTypeButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final void Function() onPress;

  const _WorkTypeButton({
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : null,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Center(
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.white : AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              const Width(10),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
