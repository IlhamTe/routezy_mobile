part of '../track_location_page.dart';

class _TimeoutExceptionBottomSheet extends StatelessWidget {
  const _TimeoutExceptionBottomSheet({required this.onSaveRoutePressed});

  final VoidCallback? onSaveRoutePressed;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      header: TextLabel('Timeout Exception', style: AppTextStyles.heading6),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wrong_location, size: 60, color: AppColors.primaryMain),
          Gap.height(24),
          TextLabel(
            "Oops! We're having trouble getting your location. Please check your GPS and try again.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          if (onSaveRoutePressed != null)
            PrimaryButton.medium(
              onPressed: onSaveRoutePressed!,
              text: 'See Previous Tracking Result',
            ),

          SecondaryButton.medium(
            onPressed: () => Navigator.pop(context),
            text: 'Close',
          ),
        ],
      ),
    );
  }
}
