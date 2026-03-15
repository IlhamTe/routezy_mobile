import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/app/routes/route_paths.dart';
import 'package:routezy_mobile/core/utils/navigation_util.dart';
import 'package:routezy_mobile/features/main_home/ui/main_home_page.dart';
import 'package:routezy_mobile/features/splash/ui/splash_page.dart';
import 'package:routezy_mobile/features/track_location/ui/track_location_page.dart';
import 'package:routezy_mobile/widget/gap/gap.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

class RouteConfig {
  RouteConfig._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final argumentData = settings.arguments;

    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(
          builder: (_) => SplashPage(key: ObjectKey(settings.name)),
          settings: RouteSettings(name: settings.name),
        );
      case RoutePaths.mainHome:
        return MaterialPageRoute(
          builder: (_) => MainHomePage(key: ObjectKey(settings.name)),
          settings: RouteSettings(name: settings.name),
        );
      case RoutePaths.trackLocation:
        return MaterialPageRoute(
          builder: (_) => TrackLocationPage(key: ObjectKey(settings.name)),
          settings: RouteSettings(name: settings.name),
        );

      // Example of route with argument data
      // case AppRoutePaths.editNutritionTarget:
      //   if (argumentData is EditNutritionTargetNavigationObject) {
      //     return MaterialPageRoute(
      //         builder: (_) => EditNutritionTargetPage(
      //           key: ObjectKey(settings.name),
      //           navigationObject: argumentData,
      //         ),
      //         settings: RouteSettings(name: settings.name));
      //   }
    }

    return MaterialPageRoute(builder: (_) => const _NotFoundPage());
  }
}

class _NotFoundPage extends StatelessWidget {
  const _NotFoundPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.neutral0,
        leading: IconButton(
          onPressed: () => router.pop(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryMain),
        ),
      ),
      backgroundColor: AppColors.neutral0,
      body: Padding(
        padding: AppPadding.ph20,
        child: Column(
          children: [
            Gap.height(128),
            Container(
              padding: AppPadding.pa20,
              decoration: BoxDecoration(
                color: AppColors.primaryMain,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.error, size: 100, color: Colors.white),
            ),
            Gap.height(24),
            TextLabel('Page Not Found', style: AppTextStyles.heading4),
            TextLabel(
              "Sorry, the page you're looking for doesn't exist. It might have been removed, had its name changed, or is temporarily unavailable",
              style: AppTextStyles.bodyReg1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
