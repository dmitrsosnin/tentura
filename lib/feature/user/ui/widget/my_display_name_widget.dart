import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/feature/user/bloc/my_profile_cubit.dart';

class MyDisplayNameWidget extends StatelessWidget {
  const MyDisplayNameWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MyProfileCubit, MyProfileState>(
        bloc: GetIt.I<MyProfileCubit>(),
        buildWhen: (p, c) => p.displayName != p.displayName,
        builder: (context, state) => Text(
          state.displayName,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.left,
        ),
      );
}
