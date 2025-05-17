import 'package:colorista/domain/colors/app_color/iapp_color.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus {
  initial,
  failure,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.color,
  });

  HomeState copyWith({
    HomeStatus? status,
    IAppColor? color,
  }) {
    return HomeState(
      status: status ?? this.status,
      color: color ?? this.color,
    );
  }

  final IAppColor? color;
  final HomeStatus status;

  @override
  List<Object?> get props => [
        status,
        color,
      ];
}
