import 'package:flutter/material.dart';
import 'package:hope/core/providers/theme_provider.dart';
import 'package:hope/core/theme/app_theme.dart';
import 'package:hope/ui/screens/auth/login/login.dart';
import 'package:hope/ui/screens/auth/register/register.dart';
import 'package:hope/ui/screens/onBoarding_screens/on_boarding/onboarding_screen.dart';
import 'package:hope/ui/screens/onBoarding_screens/set_up/setup_screen.dart';
import 'package:hope/ui/screens/onBoarding_screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late ThemeProvider themeProvider;

  //late LocaleProvider localeProvider;


  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SetupScreen.routeName: (_) => SetupScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
      },
      initialRoute: RegisterScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
    );
  }
}