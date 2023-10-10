import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiking_nepal/core/constants/app_media.dart';
import 'package:hiking_nepal/core/extensions/helper_extension.dart';
import 'package:hiking_nepal/core/theme/app_colors.dart';
import 'package:hiking_nepal/features/auth/data/model/user_model.dart';
import 'package:hiking_nepal/features/auth/presentaion/cubit/auth_cubit.dart';

import '../../../core/utils/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                    controller: _emailController,
                    style: context.textTheme.titleMedium,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  VerticalGap.l,
                  TextFormField(
                    controller: _passwordController,
                    style: context.textTheme.titleMedium,
                    obscureText: true,
                    decoration: const InputDecoration(
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.password_outlined)),
                  ),
                  VerticalGap.xxxl,
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          //login the app
                          await context.read<AuthCubit>().sigInUser(
                              user: UserModel(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim()));
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
