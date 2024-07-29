import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/features/home/presentation/controller/home_provider.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitialHomeState extends ConsumerWidget {
  const InitialHomeState({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return Column(
      children: [
        Text(
          '08:00:00 AM',
          style: context.medium32Black,
        ),
        Text(
          'May 13, 2024 - Monday',
          style: context.regular14TextSub,
        ),
        GestureDetector(
          onTap: provider.setWorkBeforeBreakState,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryLight,
            ),
            child: Container(
              width: 110,
              height: 110,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  tr.checkIn,
                  style: context.medium16White,
                ),
              ),
            ),
          ),
        ),
        Text(
          tr.checkInAndGetStartedOnYourSuccessfulDay,
          style: context.regular14Black,
        ),
      ],
    );
  }
}
