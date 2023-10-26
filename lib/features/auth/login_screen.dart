import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/ui/utils/ferry_utils.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton(
                child: const Text('Register'),
                onPressed: () async {
                  final authRepository = GetIt.I<AuthRepository>();
                  try {
                    await authRepository.register();
                    if (context.mounted) context.go(pathProfile);
                  } catch (e) {
                    rethrow;
                  }
                },
              ),
              FilledButton(
                child: const Text('Sign In'),
                onPressed: () async {
                  final authRepository = GetIt.I<AuthRepository>();
                  try {
                    await authRepository.signIn();
                    if (context.mounted) context.go(pathField);
                  } catch (e) {
                    rethrow;
                  }
                },
              ),
            ],
          ),
        ),
      );
}
