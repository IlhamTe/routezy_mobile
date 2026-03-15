part of '../splash_page.dart';

class _SplashScreen extends StatefulWidget {
  const _SplashScreen();

  @override
  State<_SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreen> {
  late final _appCubit = context.read<AppCubit>();

  @override
  void initState() {
    _initializeTrackedLocationsAndSettingData();
    _requestLocationPermission();
    super.initState();
  }

  void _initializeTrackedLocationsAndSettingData() {
    _appCubit.initializeHistoryAndSettingData();
  }

  void _requestLocationPermission() async {
    LocationPermissionUtil.requestLocationPermission();

    await Future.delayed(Duration(milliseconds: 1500));

    router.pushToRemoveUntil(RoutePaths.mainHome);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: SizeHelper.getScreenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(AssetImages.appLogo, width: 100, height: 100),
            Gap.height(),
            TextLabel(
              'Every step - Every route',
              textAlign: TextAlign.center,
              color: AppColors.primaryMain,
              style: AppTextStyles.displayMed2.copyWith(
                height: 1.5,
                fontStyle: FontStyle.italic,
              ),
            ),
            Spacer(),
            TextLabel(
              'Version 1.0.0',
              style: AppTextStyles.bodyRegular5,
              color: AppColors.textPlaceholder,
            ),
            Gap.height(48),
          ],
        ),
      ),
    );
  }
}
