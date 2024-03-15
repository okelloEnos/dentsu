import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentsu_test/util/util_barrel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/log_in/login_barrel.dart';

final dio = Dio(BaseOptions(
  baseUrl: baseUrl,
  receiveDataWhenStatusError: true,
  connectTimeout: connectTimeout,
  sendTimeout: sendTimeout,
  receiveTimeout: receiveTimeout,
  contentType: 'application/json',
));

late SharedPreferences sharedPreferences;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const DentsuApp());
}

class DentsuApp extends StatelessWidget {
  const DentsuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (_) => LogInBloc(
              logInRepository: LogInRepository(
                  logInRemoteDataProvider: LogInRemoteDataProvider(dio: dio)))),
    ], child: const DentsuAppView());
  }
}

class DentsuAppView extends StatelessWidget {
  const DentsuAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Dentsu App',
      theme: AppTheme.lightTheme(),
      themeMode: ThemeMode.light,
      locale: const Locale('en', 'KE'),
    );
  }
}
