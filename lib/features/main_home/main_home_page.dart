import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/routes/route_paths.dart';
import 'package:routezy_mobile/core/utils/location_permission_util.dart';
import 'package:routezy_mobile/core/utils/navigation_util.dart';
import 'package:routezy_mobile/features/home/home_page.dart';
import 'package:routezy_mobile/features/setting/ui/setting_page.dart';
import 'package:routezy_mobile/widget/bottom_nav_bar/notched_bottom_navbar.dart';

part 'screen/main_home_screen.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _MainHomeScreen();
  }
}
