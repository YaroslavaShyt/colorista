import 'package:colorista/domain/colors/app_color/iapp_color.dart';
import 'package:colorista/domain/services/icolors_service.dart';
import 'package:colorista/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required IColorService colorService,
  })  : _colorService = colorService,
        super(const HomeState());

  final IColorService _colorService;

  final int defaultColor = 0xff;

  Future<void> onScreenTap() async {
    try {
      print("tap");
      final IAppColor color = await _getNewColor();

      emit(state.copyWith(color: color));
    } catch (error) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<IAppColor> _getNewColor() async {
    IAppColor newColor = await _colorService.generateColor();
    return newColor;
  }

  void onRetryTap() {
    emit(state.copyWith(status: HomeStatus.initial));
  }
}
