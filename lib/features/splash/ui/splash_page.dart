import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/app/global_cubit/app/app_cubit.dart';
import 'package:routezy_mobile/app/routes/route_paths.dart';
import 'package:routezy_mobile/core/shared/asset/asset_image.dart';
import 'package:routezy_mobile/core/utils/location_permission_util.dart';
import 'package:routezy_mobile/core/utils/navigation_util.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';
import 'package:routezy_mobile/widget/gap/gap.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

part 'screen/splash_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _SplashScreen();
  }
}
