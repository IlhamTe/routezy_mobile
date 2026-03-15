part of 'app_cubit.dart';

class AppState extends Equatable {
  final ViewData stateAppInitial;

  const AppState({required this.stateAppInitial});

  factory AppState.initial() {
    return AppState(stateAppInitial: ViewData.initial());
  }

  @override
  List<Object?> get props => [stateAppInitial];

  AppState copyWith({ViewData? stateAppInitial}) {
    return AppState(stateAppInitial: stateAppInitial ?? this.stateAppInitial);
  }
}
