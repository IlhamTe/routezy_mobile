import 'package:equatable/equatable.dart';

class DistanceFilterModel extends Equatable {
  final String label;
  final int value;

  const DistanceFilterModel({required this.label, required this.value});

  @override
  List<Object?> get props => [label, value];
}
