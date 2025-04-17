
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/core/constants/route_names.dart';
import 'package:tastyready_mobile/core/theme/light_theme.dart';
import 'package:tastyready_mobile/core/utils/app_localizations.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/verify_phone_page.dart';
import 'package:tastyready_mobile/features/auth/presentation/views/login_view.dart';
import 'package:tastyready_mobile/features/dashboard/presentation/dashboard_page.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:tastyready_mobile/features/splash/presentation/pages/splash_page.dart';
import 'package:tastyready_mobile/features/splash/presentation/pages/welcome_page.dart';
import 'package:tastyready_mobile/main.dart';
import 'di.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

 BlocProvider(create: (context) => di.sl<AuthBloc>()),
 BlocProvider(create: (context) => di.sl<SplashBloc>()),



      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:LightTheme.theme,
        home: SplashPage(),
      
        routes: {
          '/welcome': (context) => WelcomeScreen(),
          RouteNames.login: (context) =>  LoginView(),
          RouteNames.home: (context) =>  DashboardPage(),
          RouteNames.verifyPhonePage: (context) =>  PhoneVerificationPage(
            phoneNumber: '',
          ),
          // Add other routes here
          // '/login': (context) => LoginPage(),
          // '/dashboard': (context) => DashboardPage(),  
          // '/forgot-password': (context) => ForgotPasswordPage(),
        },
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English
          Locale('es', ''), // Spanish
          // Add other supported locales here
        ],
      ),
    );
  }
}


