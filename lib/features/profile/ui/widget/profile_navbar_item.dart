import 'package:flutter/material.dart';

import '../../data/user_utils.dart';
import '../bloc/profile_cubit.dart';

class ProfileNavBarItem extends StatelessWidget {
  const ProfileNavBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: GetIt.I<ProfileCubit>(),
      buildWhen: (p, c) => p.profile.imageId != c.profile.imageId,
      builder: (context, state) => const Icon(Icons.account_circle_outlined),
    );
  }
}
