import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ViewState { initial, loading, error, success }

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;

  bool get isNotLoading => this != ViewState.loading;

  bool get isInitial => this == ViewState.initial;

  bool get isError => this == ViewState.error;

  bool get isSuccess => this == ViewState.success;
}

class ViewData<T> extends Equatable {
  final ViewState status;
  final T? data;
  final String? message;

  const ViewData._({required this.status, this.data, this.message = ''});

  factory ViewData.success({T? data, String? message}) {
    return ViewData._(status: ViewState.success, data: data, message: message);
  }

  factory ViewData.error({T? data, String? message}) {
    return ViewData._(status: ViewState.error, data: data, message: message);
  }

  factory ViewData.loading({String? message}) {
    return ViewData._(status: ViewState.loading, message: message);
  }

  factory ViewData.initial() {
    return const ViewData._(status: ViewState.initial);
  }

  Widget when({
    Function()? initial,
    required Function() loading,
    required Function(String? message) error,
    required Function(T data) success,
  }) {
    switch (status) {
      case ViewState.initial:
        return initial?.call() ?? loading();
      case ViewState.loading:
        return loading();
      case ViewState.error:
        return error(message);
      case ViewState.success:
        return success(data as T);
    }
  }

  @override
  List<Object?> get props => [status, data, message];

  ViewData<T> copyWith({ViewState? status, T? data, String? message}) {
    return ViewData._(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
