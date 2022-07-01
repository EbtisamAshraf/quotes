import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/config/themes/app_theme.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/presentation/pages/quote_screen.dart';


class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme:appTheme(),
      home: const QuoteScreen(),
      onGenerateRoute: RouteGenerator.getRoute,

    );
  }
}

