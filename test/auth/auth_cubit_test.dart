// ignore_for_file: avoid_print

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../_mock/hydrated_db_mock.dart';
import 'mock/auth_service_mock.dart';

void main() async {
  // TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'AuthCubit test group: ',
    () {
      late AuthCubit authCubit;

      setUp(() {
        print('SetUpGroup');
        HydratedBloc.storage = HydratedStorageMock();
        authCubit = AuthCubit(
          authService: AuthServiceMock(),
          trySignIn: false,
        )..stream.listen(print);
      });

      tearDown(() {
        print('TearDownGroup');
        authCubit.close();
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
