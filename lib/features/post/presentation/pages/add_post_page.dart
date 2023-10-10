import 'package:flutter/material.dart';
import 'package:hiking_nepal/core/constants/app_media.dart';
import 'package:hiking_nepal/core/extensions/helper_extension.dart';
import 'package:hiking_nepal/core/theme/app_colors.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Share Your Memory",
          style: context.textTheme.titleLarge,
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            children: [
              SizedBox(
                height: context.height * 0.4,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          image: const DecorationImage(
                              image: AssetImage(AppMedia.addPostCoverImage))),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
