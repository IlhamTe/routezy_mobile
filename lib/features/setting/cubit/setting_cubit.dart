import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_ce/hive.dart';
import 'package:routezy_mobile/core/data/setting/model/setting_model.dart';
import 'package:routezy_mobile/core/shared/view_data_state.dart';
import 'package:routezy_mobile/features/setting/model/distance_filter_model.dart';
import 'package:routezy_mobile/features/setting/model/time_limit_model.dart';
import 'package:routezy_mobile/features/setting/repository/setting_repository.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({required SettingRepository repository})
    : _repository = repository,
      super(SettingState.initial());

  final SettingRepository _repository;

  Future<void> onRefresh() async {
    final currentData = _repository.getSettingData();
    if (currentData != null) {
      await _repository.saveAndUpdateSetting(currentData);
    }
  }

  ValueListenable<Box<SettingModel>> listenSettingChanges() {
    return _repository.listenSettingChanges();
  }

  void saveAndUpdateSetting(SettingModel item) async {
    try {
      emit(state.copyWith(stateSaveSettings: ViewData.loading()));

      await _repository.saveAndUpdateSetting(item);

      emit(state.copyWith(stateSaveSettings: ViewData.success()));
    } catch (e) {
      emit(state.copyWith(stateSaveSettings: ViewData.error()));
    }
  }
}
