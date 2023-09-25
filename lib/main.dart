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
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: LightColor.primaryColor),
          inputDecorationTheme: InputDecorationTheme(
              prefixIconColor: LightColor.primaryColor,
              //     MaterialStateColor.resolveWith((Set<MaterialState> states) {
              //   if (states.contains(MaterialState.focused)) {
              //     return Colors.grey;
              //   }

              //   return LightColor.secondaryColor;
              // }),
              labelStyle: const TextStyle(
                  color: LightColor.secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.primaryBorderRadius),
                  borderSide: const BorderSide(color: LightColor.primaryColor)),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppConstants.primaryBorderRadius),
                borderSide: const BorderSide(color: LightColor.primaryColor),
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
              contentPadding: const EdgeInsets.all(16)),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: LightColor.primaryColor,
              secondary: LightColor.secondaryColor,
              brightness: Brightness.light,
              onSecondary: LightColor.primaryText),
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                  color: LightColor.primaryText,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
              headlineMedium: TextStyle(
                  color: LightColor.primaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              headlineSmall: TextStyle(
                  color: LightColor.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              bodyLarge: TextStyle(
                  color: LightColor.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              bodyMedium: TextStyle(
                  color: LightColor.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              bodySmall: TextStyle(
                  color: LightColor.primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              titleSmall: TextStyle(
                  color: LightColor.primaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              titleMedium: TextStyle(
                  color: LightColor.primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              titleLarge: TextStyle(
                  color: LightColor.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: LightColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          )),
      home: const LoginScreen(),
    );
  }
}
