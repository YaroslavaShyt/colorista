import 'package:colorista/presentation/home/bloc/home_cubit.dart';
import 'package:colorista/presentation/home/bloc/home_state.dart';
import 'package:colorista/presentation/home/widgets/hello_there_widget.dart';
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
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(state.color),
              ),
              child: Center(
                child: HelloThereWidget(),
              ),
            );
          },
        ),
      ),
    );
  }
}
