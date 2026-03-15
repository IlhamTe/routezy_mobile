import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/tracked_location_model.dart';
import 'package:routezy_mobile/core/shared/view_data_state.dart';
import 'package:routezy_mobile/features/home/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required HomeRepository repository})
    : _repository = repository,
      super(HomeState.initial());

  final HomeRepository _repository;

  ValueListenable<Box<TrackedLocationModel>> listenTrackedLocationChanges() {
    return _repository.listenTrackedLocationChanges();
  }
}
