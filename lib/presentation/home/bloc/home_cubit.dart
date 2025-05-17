import 'package:colorista/domain/handlers/icolor_handler.dart';
import 'package:colorista/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required IColorHandler colorHandler,
  })  : _colorHandler = colorHandler,
        super(const HomeState());

  final IColorHandler _colorHandler;

  void onScreenTap() {
    try {
      final int color = _getNewColor();

      emit(state.copyWith(color: color));
    } catch (error) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  int _getNewColor() {
    int newColor = _colorHandler.generateColor();
    while (newColor == state.color) {
      newColor = _colorHandler.generateColor();
    }

    return newColor;
  }

  void onRetryTap() {
    emit(state.copyWith(status: HomeStatus.initial));
  }
}
