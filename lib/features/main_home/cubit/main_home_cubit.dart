import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:routezy_mobile/core/shared/view_data_state.dart';
import 'package:routezy_mobile/features/main_home/repository/main_home_repository.dart';

part 'main_home_state.dart';

class MainHomeCubit extends Cubit<MainHomeState> {
  MainHomeCubit({required MainHomeRepository repository})
    : _repository = repository,
      super(MainHomeState.initial());

  final MainHomeRepository _repository;
}
