import 'package:chatifyapp/src/core/constants/constants_export.dart';
import 'package:chatifyapp/src/features/authentication/authentication_export.dart';
import 'package:chatifyapp/src/features/home/presentation/home_screen/home_screen.dart';
import 'package:chatifyapp/src/features/splash/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'src/application/application_export.dart';

void main() {
  runApp(
    SplashScreen(
      key: UniqueKey(),
      onInitializationComplete: () => runApp(
        const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProviderService>(
          create: (BuildContext _context) => AuthenticationProviderService(),
        ),
      ],
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: [
            const ResponsiveBreakpoint.resize(350, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(600, name: TABLET, scaleFactor: 1.25),
            const ResponsiveBreakpoint.resize(800, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(1200, name: 'XL', scaleFactor: 1.2),
            const ResponsiveBreakpoint.autoScale(1700, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        title: 'Chatify',
        theme: ThemeData(
          backgroundColor: AppColors.appPrimaryBackgroundColor,
          scaffoldBackgroundColor: AppColors.appPrimaryBackgroundColor,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.appSecondaryBackgroundColor,
          ),
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _context) => const LoginScreen(),
          '/register': (BuildContext _context) => const RegisterScreen(),
          '/home': (BuildContext _context) => const HomeScreen(),
        },
      ),
    );
  }
}
