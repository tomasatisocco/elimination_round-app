import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/authentication/display/cubit/authentication_cubit.dart';
import 'features/login/display/cubit/login_cubit/login_cubit.dart';
import 'features/login/display/pages/login_page.dart';
import 'features/show_my_rounds/data/models/round_model.dart';
import 'features/show_my_rounds/display/cubit/show_my_rounds_cubit.dart';
import 'features/show_my_rounds/display/pages/show_my_rounds_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(RoundModelAdapter());
  EquatableConfig.stringify = kDebugMode;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoginCubit>(create: (_) => LoginCubit()),
      BlocProvider<AuthenticationCubit>(create: (_) => AuthenticationCubit()),
      BlocProvider<ShowMyRoundsCubit>(create: (_) => ShowMyRoundsCubit()),
    ], child: const AppView());
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticatedUser) {
              context.read<ShowMyRoundsCubit>().loadMyRounds();
              _navigator!.pushAndRemoveUntil<void>(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/Home"),
                    builder: (_) => const ShowMyRoundsPage(),
                  ),
                  (route) => false);
            } else if (state is UnauthenticatedUser || state is UnknownUser) {
              _navigator!.pushAndRemoveUntil<void>(
                  MaterialPageRoute(builder: (_) => LoginPage()),
                  (route) => false);
            } else {
              _navigator!.pushAndRemoveUntil<void>(
                  MaterialPageRoute(builder: (_) => LoginPage()),
                  (route) => false);
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) =>
          MaterialPageRoute(builder: (_) => const SplashPage()),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationCubit>().authenticationUserChanged();
    return Container(
      child: const Center(child: Text('Splash page')),
      color: Colors.white,
    );
  }
}
