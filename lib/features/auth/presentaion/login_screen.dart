import 'package:flutter/material.dart';
import 'package:hiking_nepal/core/constants/app_media.dart';
import 'package:hiking_nepal/core/extensions/helper_extension.dart';
import 'package:hiking_nepal/core/theme/app_colors.dart';

import '../../../core/utils/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppMedia.loginImage,
                    ),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: LightColor.whiteSmoke,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Sign in",
                    style:
                        context.textTheme.headlineSmall!.copyWith(fontSize: 30),
                  ),
                  VerticalGap.xl,
                  TextFormField(
                    style: context.textTheme.titleMedium,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  VerticalGap.l,
                  TextFormField(
                    style: context.textTheme.titleMedium,
                    obscureText: true,
                    decoration: const InputDecoration(
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.password_outlined)),
                  ),
                  VerticalGap.xxxl,
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          //login the app
                        },
                        child: const Text('Login')),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
