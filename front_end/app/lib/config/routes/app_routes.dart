import 'package:app/presentation/screens/intro_screen.dart';
import 'package:app/presentation/screens/login_screen.dart';
import 'package:app/presentation/screens/register_screen.dart';
import 'package:app/presentation/screens/welcommingScreen/welcomming_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String introduction = '/introScreen';
  static const String index = '/';
  static const String login = '/login';
  static const String regsiter = '/register';
  static const String home = '/home';
  static const String trip = '/trip';
  static GoRouter generateRoutes() {
    return GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: introduction,
        name: introduction,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        path: index,
        name: index,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: login,
        name: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: regsiter,
        name: regsiter,
        builder: (context, state) => const RegisterScreen(),
      ),
    ]);
  }
}
