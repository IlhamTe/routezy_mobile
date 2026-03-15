import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:routezy_mobile/app/design_system/app_border_radius.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/lat_long_model.dart';
import 'package:routezy_mobile/core/injections/get_it.dart';
import 'package:routezy_mobile/core/utils/date_format_util.dart';
import 'package:routezy_mobile/core/utils/map_util.dart';
import 'package:routezy_mobile/core/utils/show_widget_helper.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';
import 'package:routezy_mobile/features/home/cubit/home_cubit.dart';
import 'package:routezy_mobile/features/home/repository/home_repository.dart';
import 'package:routezy_mobile/widget/bottom_sheet/bottom_sheet_base.dart';
import 'package:routezy_mobile/widget/button/ink_pressable_button.dart';
import 'package:routezy_mobile/widget/button/primary_button.dart';
import 'package:routezy_mobile/widget/gap/gap.dart';
import 'package:routezy_mobile/widget/map/polyline_preview.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

part 'screen/home_screen.dart';

/// Sections
part 'section/map_preview_bottom_sheet.dart';

/// Widgets
part 'widget/track_location_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(repository: getIt<HomeRepository>()),
      child: _HomeScreen(),
    );
  }
}
