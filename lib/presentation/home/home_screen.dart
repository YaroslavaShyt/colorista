import 'package:colorista/presentation/home/bloc/home_cubit.dart';
import 'package:colorista/presentation/home/bloc/home_state.dart';
import 'package:colorista/presentation/home/widgets/main_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.cubit,
    super.key,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: cubit.onScreenTap,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (_, HomeState state) {
            final int color = state.color?.hexColor ?? cubit.defaultColor;

            return AnimatedContainer(
              padding: const EdgeInsetsDirectional.all(20),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(color),
              ),
              child: MainContentWidget(state: state),
            );
          },
        ),
      ),
    );
  }
}
