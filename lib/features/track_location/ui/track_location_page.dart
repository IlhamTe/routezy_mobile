import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';
import 'package:routezy_mobile/app/design_system/app_border_radius.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/lat_long_model.dart';
import 'package:routezy_mobile/core/injections/get_it.dart';
import 'package:routezy_mobile/core/shared/asset/asset_animation.dart';
import 'package:routezy_mobile/core/shared/enum/snackbar_type_enum.dart';
import 'package:routezy_mobile/core/shared/view_data_state.dart';
import 'package:routezy_mobile/core/utils/location_permission_util.dart';
import 'package:routezy_mobile/core/utils/map_util.dart';
import 'package:routezy_mobile/core/utils/navigation_util.dart';
import 'package:routezy_mobile/core/utils/show_widget_helper.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';
import 'package:routezy_mobile/features/track_location/cubit/track_location_cubit.dart';
import 'package:routezy_mobile/features/track_location/repository/track_location_repository.dart';
import 'package:routezy_mobile/widget/bottom_sheet/bottom_sheet_base.dart';
import 'package:routezy_mobile/widget/bottom_sheet/location_permission_alert_bottom_sheet.dart';
import 'package:routezy_mobile/widget/button/primary_button.dart';
import 'package:routezy_mobile/widget/button/secondary_button.dart';
import 'package:routezy_mobile/widget/gap/gap.dart';
import 'package:routezy_mobile/widget/map/polyline_preview.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

part 'screen/track_location_screen.dart';

/// Sections
part 'section/idle_section.dart';
part 'section/tracking_result_bottom_sheet.dart';
part 'section/timeout_exception_bottom_sheet.dart';

class TrackLocationPage extends StatelessWidget {
  const TrackLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrackLocationCubit(repository: getIt<TrackLocationRepository>()),
      child: _TrackLocationScreen(),
    );
  }
}
