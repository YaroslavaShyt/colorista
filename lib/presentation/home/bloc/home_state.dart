import 'package:equatable/equatable.dart';

enum HomeStatus {
  initial,
  failure,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.color = 00000,
  });

  HomeState copyWith({
    HomeStatus? status,
    int? color,
  }) {
    return HomeState(
      status: status ?? this.status,
      color: color ?? this.color,
    );
  }

  final int color;
  final HomeStatus status;

  @override
  List<Object?> get props => [
        status,
        color,
      ];
}
