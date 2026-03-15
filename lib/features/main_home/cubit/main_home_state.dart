part of 'main_home_cubit.dart';

class MainHomeState extends Equatable {
  final ViewData stateMainHome;

  const MainHomeState({required this.stateMainHome});

  factory MainHomeState.initial() {
    return MainHomeState(stateMainHome: ViewData.initial());
  }

  @override
  List<Object?> get props => [stateMainHome];

  MainHomeState copyWith({ViewData? stateMainHome}) {
    return MainHomeState(stateMainHome: stateMainHome ?? this.stateMainHome);
  }
}
