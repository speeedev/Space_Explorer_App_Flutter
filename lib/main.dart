import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:space_explorer/core/constants/app/app_constants.dart';
import 'package:space_explorer/core/init/navigation/navigation_route.dart';
import 'package:space_explorer/core/init/navigation/navigation_service.dart';
import 'package:space_explorer/core/init/theme/theme_data.dart';
import 'package:space_explorer/features/home/presentation/view_model/home_view_model.dart';
import 'package:space_explorer/features/splash/presentation/splash_view.dart';
import 'package:space_explorer/features/splash/presentation/view_model/splash_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    return MaterialApp(
      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: MyTheme.themeData(context),
      home: const SplashView(),
    );
  }
}
