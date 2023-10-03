import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/ui/ferry_utils.dart';

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
                  if (await authRepository.register() && context.mounted) {
                    context.go(pathProfileEdit);
                  }
                },
              ),
              FilledButton(
                child: const Text('Sign In'),
                onPressed: () async {
                  final authRepository = GetIt.I<AuthRepository>();
                  if (await authRepository.signIn() && context.mounted) {
                    context.go(pathField);
                  }
                },
              ),
            ],
          ),
        ),
      );
}
