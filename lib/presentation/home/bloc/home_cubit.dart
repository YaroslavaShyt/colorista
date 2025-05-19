import 'package:colorista/core/constants/color_constants.dart';
import 'package:colorista/core/logger.dart';
import 'package:colorista/domain/colors/app_color/iapp_color.dart';
import 'package:colorista/domain/services/icolors_service.dart';
import 'package:colorista/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit for managing the Home screen state
class HomeCubit extends Cubit<HomeState> {
  final IColorsService _colorService;

  /// Default color value
  int get defaultColor =>
      state.color?.hexColor ?? ColorConstants.defaultHexColor;

  /// Requires color service for generating colors
  HomeCubit({
    required IColorsService colorService,
  })  : _colorService = colorService,
        super(const HomeState());

  /// Get new color on screen tap
  Future<void> onScreenTap() async {
    try {
      final IAppColor color = await _getNewColor();

      emit(state.copyWith(color: color));
    } catch (error) {
      logger.e(error);
    }
  }

  /// Request a new color from the service
  Future<IAppColor> _getNewColor() async {
    return _colorService.generateColor();
  }
}
