import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/feature/user/bloc/my_profile_cubit.dart';

class MyDescriptionWidget extends StatelessWidget {
  const MyDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MyProfileCubit, MyProfileState>(
        bloc: GetIt.I<MyProfileCubit>(),
        buildWhen: (p, c) => p.description != p.description,
        builder: (context, state) => Text(
          state.description,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
      );
}
