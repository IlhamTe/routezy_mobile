import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/core/data/setting/model/setting_model.dart';
import 'package:routezy_mobile/core/injections/get_it.dart';
import 'package:routezy_mobile/core/shared/enum/snackbar_type_enum.dart';
import 'package:routezy_mobile/core/shared/view_data_state.dart';
import 'package:routezy_mobile/core/utils/show_widget_helper.dart';
import 'package:routezy_mobile/features/setting/cubit/setting_cubit.dart';
import 'package:routezy_mobile/features/setting/model/distance_filter_model.dart';
import 'package:routezy_mobile/features/setting/model/time_limit_model.dart';
import 'package:routezy_mobile/features/setting/repository/setting_repository.dart';
import 'package:routezy_mobile/widget/bottom_sheet/bottom_sheet_base.dart';
import 'package:routezy_mobile/widget/button/ink_pressable_button.dart';
import 'package:routezy_mobile/widget/button/picker_button.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

part 'screen/setting_screen.dart';

/// Sections
part 'section/select_accuracy_bottom_sheet.dart';

part 'section/select_distance_filter_bottom_sheet.dart';

part 'section/select_time_limit_bottom_sheet.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(repository: getIt<SettingRepository>()),
      child: _SettingScreen(),
    );
  }
}
