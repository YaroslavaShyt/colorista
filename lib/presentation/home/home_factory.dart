import 'package:colorista/core/service_locator.dart';
import 'package:colorista/domain/handlers/icolor_handler.dart';
import 'package:colorista/presentation/home/bloc/home_cubit.dart';
import 'package:colorista/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFactory extends StatelessWidget {
  const HomeFactory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => HomeCubit(
        colorHandler: sl.get<IColorHandler>(),
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
