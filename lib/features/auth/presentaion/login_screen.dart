import 'package:flutter/material.dart';
import 'package:hiking_nepal/core/constants/app_media.dart';
import 'package:hiking_nepal/core/extensions/helper_extension.dart';
import 'package:hiking_nepal/core/theme/app_colors.dart';

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
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    color: LightColor.whiteSmoke,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20))),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in",
                      style: context.textTheme.headlineSmall!
                          .copyWith(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      style: context.textTheme.titleMedium,
                      decoration: const InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.email_outlined)),
                    )
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
