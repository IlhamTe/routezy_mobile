import 'package:equatable/equatable.dart';

class TimeLimitModel extends Equatable {
  final String label;
  final int? value;

  const TimeLimitModel({required this.label, required this.value});

  @override
  List<Object?> get props => [label, value];
}
