import 'package:colorista/domain/colors/app_color/iapp_color.dart';
import 'package:equatable/equatable.dart';

/// State of the Home screen
class HomeState extends Equatable {
  /// The current color of the Home screen
  final IAppColor? color;

  /// Equatable implementation for comparing instances of HomeState
  @override
  List<Object?> get props => [color];

  /// Default color is null
  const HomeState({
    this.color,
  });

  /// Creates a copy of the current HomeState.
  /// If no color is provided, the existing color remains unchanged
  HomeState copyWith({IAppColor? color}) {
    return HomeState(
      color: color ?? this.color,
    );
  }
}
