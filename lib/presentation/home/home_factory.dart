import 'package:colorista/core/service_locator.dart';
import 'package:colorista/domain/services/icolors_service.dart';
import 'package:colorista/presentation/home/bloc/home_cubit.dart';
import 'package:colorista/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Factory to render HomeScreen wrapped in HomeCubit
class HomeFactory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => HomeCubit(
        colorService: sl.get<IColorsService>(),
      ),
      child: Builder(
        builder: (context) {
          return HomeScreen(
            cubit: BlocProvider.of<HomeCubit>(context),
          );
        },
      ),
    );
  }
}
