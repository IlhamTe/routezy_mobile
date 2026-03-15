part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ViewData stateHome;

  const HomeState({required this.stateHome});

  factory HomeState.initial() {
    return HomeState(stateHome: ViewData.initial());
  }

  @override
  List<Object?> get props => [stateHome];

  HomeState copyWith({ViewData? stateHome}) {
    return HomeState(stateHome: stateHome ?? this.stateHome);
  }
}
