import 'package:flutter/material.dart';
import 'package:pmsn_p6/screens/dashboard_screen.dart';
import 'package:pmsn_p6/screens/productos_firebase_screen.dart';
import 'package:pmsn_p6/screens/splash_screen.dart';
import 'package:pmsn_p6/settings/app_value_notifier.dart';
import 'package:pmsn_p6/settings/theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppValueNotifier.banTheme,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: value
              ? ThemeApp.darkTheme(context)
              : ThemeApp.lightTheme(context),
          home: const SplashScreen(),
          routes: {
            "/dash": (BuildContext context) => const DashboardScreen(),
            "/productos": (BuildContext context) =>
                const ProductsFirebaseScreen(),
          },
        );
      },
    );
  }
}
