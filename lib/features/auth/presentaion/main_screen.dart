// import 'package:flutter/material.dart';
// import 'package:hiking_nepal/core/routes/app_routes.dart';
// import 'package:hiking_nepal/di/injection_container.dart';
// import 'package:hiking_nepal/features/auth/domain/repository/user_repository.dart';
// import 'package:hiking_nepal/features/auth/presentaion/login_screen.dart';
// import 'package:hiking_nepal/features/home/presentation/home_page.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: getIt<UserRepository>().authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.data?.uid != null) {
//           con
//           return  Container();
//         } else {
//           return const LoginScreen();
//         }
//       },
//     );
//   }
// }
