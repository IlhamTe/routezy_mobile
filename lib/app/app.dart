import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routezy_mobile/app/global_cubit/app/app_cubit.dart';
import 'package:routezy_mobile/app/routes/route_config.dart';
import 'package:routezy_mobile/app/routes/route_paths.dart';
import 'package:routezy_mobile/core/data/setting/setting_local_data.dart';
import 'package:routezy_mobile/core/data/tracked_location/tracked_location_local_data.dart';
import 'package:routezy_mobile/core/injections/get_it.dart';
import 'package:routezy_mobile/core/utils/navigation_util.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(context);
    return BlocProvider(
      create: (context) => AppCubit(
        trackedLocationLocalData: getIt<TrackedLocationLocalData>(),
        settingLocalData: getIt<SettingLocalData>(),
      ),
      child: MaterialApp(
        title: 'Routezy',
        initialRoute: RoutePaths.splash,
        onGenerateRoute: RouteConfig.generateRoute,
        navigatorKey: router.navigatorKey,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
