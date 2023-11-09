import 'package:flutter/material.dart';
import 'package:hiking_nepal/core/constants/app_constants.dart';

import 'package:hiking_nepal/core/utils/gap.dart';

class CustomTile extends StatelessWidget {
  ///custom suffix widget
  final Widget suffix;

  ///name of the title
  final String title;

  ///icon data
  final IconData iconData;

  const CustomTile({
    Key? key,
    required this.suffix,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pad8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(iconData),
              HorizontalGap.s,
              Text(title),
            ],
          ),
          suffix
        ],
      ),
    );
  }
}
