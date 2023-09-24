import 'package:flutter/material.dart';
import 'package:hiking_nepal/core/constants/app_constants.dart';
import 'package:hiking_nepal/core/theme/app_colors.dart';

import 'features/auth/presentaion/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiking Nepal',
      theme: ThemeData(
          primaryColor: LightColor.primaryColor,
          fontFamily: 'Montserrat',
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.primaryBorderRadius),
                  borderSide:
                      const BorderSide(color: LightColor.secondaryColor)),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppConstants.primaryBorderRadius),
                borderSide: const BorderSide(color: LightColor.secondaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppConstants.primaryBorderRadius),
                borderSide: const BorderSide(color: LightColor.primaryColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppConstants.primaryBorderRadius),
                borderSide: const BorderSide(color: AppColors.errorColor),
              ),
              contentPadding: const EdgeInsets.all(16))),
      home: const LoginScreen(),
    );
  }
}
