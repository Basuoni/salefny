import 'package:salefny/app/core/themes/app_colors.dart';
import 'package:salefny/generated/style_atoms.dart';
import 'package:salefny/app/core/widgets/custom_sized_box.dart';
import 'package:salefny/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kcSubTextColor.withOpacity(0.06)),
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          Assets.svgNotification,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            color,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 7,
                  )
                ],
              ),
              Positioned(
                top: 3, // Adjust the position as needed
                right: 3, // Adjust the position as needed
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: 7, // Image radius
                ),
              ),
            ],
          ),
          const SizedBox(width: 10), // Add some spacing between the elements
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tue, 4/30/2024 8:30 PM',
                style: context.regular12TextPlaceholder,
              ),
              const Height(12),
              Text(
                'New alert',
                style: context.medium14Black,
              ),
              const Height(12),
              Text(
                'Describe the details of the new alert here',
                style: context.regular12TextSub,
              )
            ],
          ),
        ],
      ),
    );
  }
}
