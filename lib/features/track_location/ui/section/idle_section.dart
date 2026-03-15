part of '../track_location_page.dart';

class _IdleSection extends StatelessWidget {
  const _IdleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        TextLabel(
          'Ready to hit the road?',
          style: AppTextStyles.bodyBold2,
          color: AppColors.primaryMain,
          textAlign: TextAlign.center,
        ),
        TextLabel(
          'Start your run!',
          style: AppTextStyles.heading1,
          color: AppColors.primaryMain,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
