import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import 'mock/auth_service_mock.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'AuthCubit test group: ',
    () {
      late AuthCubit authCubit;

      setUp(() async {
        HydratedBloc.storage = await HydratedStorage.build(
          storageDirectory: Directory.systemTemp,
        );
        authCubit = AuthCubit(authService: AuthServiceMock());
      });

      tearDown(() async {
        await authCubit.close();
        await HydratedBloc.storage.close();
      });

      blocTest<AuthCubit, AuthState>(
        'Sign Up test',
        build: () => authCubit,
        act: (cubit) => cubit.signUp(),
        // Skip loading state
        skip: 1,
        expect: () => [
          const AuthState(
            currentAccount: AuthServiceMock.mockId,
            accounts: {
              AuthServiceMock.mockId: AuthServiceMock.mockSeed,
            },
          ),
        ],
      );

      blocTest<AuthCubit, AuthState>(
        'Sign Out test',
        build: () => authCubit,
        seed: () => const AuthState(
          currentAccount: AuthServiceMock.mockId,
          accounts: {
            AuthServiceMock.mockId: AuthServiceMock.mockSeed,
          },
        ),
        act: (cubit) => cubit.signOut(),
        expect: () => [
          const AuthState(
            accounts: {
              AuthServiceMock.mockId: AuthServiceMock.mockSeed,
            },
          ),
        ],
      );
    },
  );
}
