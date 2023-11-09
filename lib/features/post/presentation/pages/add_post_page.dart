import 'package:flutter/material.dart';
import 'package:hiking_nepal/core/constants/app_constants.dart';
import 'package:hiking_nepal/core/constants/app_media.dart';
import 'package:hiking_nepal/core/extensions/helper_extension.dart';
import 'package:hiking_nepal/core/services/date_parser_service.dart';
import 'package:hiking_nepal/core/theme/app_colors.dart';
import 'package:hiking_nepal/core/utils/gap.dart';
import 'package:hiking_nepal/features/post/presentation/widgets/custom_tile.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  final List<String> _category = ['Hike', 'Trek', 'Ride/Drive'];
  late String selectedCategory;

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    selectedCategory = _category[0];
    _selectedDate = DateTime.now();
  }

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
          ///image section

          Column(
            children: [
              SizedBox(
                height: context.height * 0.3,
                width: context.width,
                child: Stack(
                  children: [
                    Container(
                      height: context.height * 0.25,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          image: const DecorationImage(
                              image: AssetImage(AppMedia.addPostCoverImage),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 0,
                      left: context.width * 0.39,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: CircleAvatar(
                          backgroundColor: LightColor.secondaryBackgroundColor,
                          radius: 40,
                          child: IconButton(
                            onPressed: () {
                              ///add image
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              VerticalGap.l,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppConstants.pad8),
                child: Column(
                  children: [
                    TextFormField(
                      style: context.textTheme.bodySmall,
                      controller: _nameController,
                      textInputAction: TextInputAction.next,
                      decoration:
                          _makePageInputDecoration("Name of Destination"),
                    ),
                    VerticalGap.s,
                    TextFormField(
                      style: context.textTheme.bodySmall,
                      controller: _descriptionController,
                      decoration: _makePageInputDecoration("Description"),
                    ),
                    VerticalGap.l,

                    ///category
                    CustomTile(
                      iconData: Icons.category,
                      title: "Category",
                      suffix: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          alignment: AlignmentDirectional.centerEnd,
                          icon: const SizedBox.shrink(),
                          value: selectedCategory,
                          dropdownColor: LightColor.whiteSmoke,
                          items: _category
                              .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: context.textTheme.bodySmall!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor),
                                  )))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value ?? selectedCategory;
                            });
                          },
                        ),
                      ),
                    ),

                    ///date
                    CustomTile(
                        title: "Date",
                        iconData: Icons.calendar_today,
                        suffix: Text(
                          DateParserService.getDateOnly(_selectedDate),
                          style: context.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        )
                        // DatePickerDialog(
                        //     initialDate: DateTime.now(),
                        //     firstDate: DateTime.now(),
                        //     lastDate:
                        //         DateTime.now().add(const Duration(days: 365))),
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

  InputDecoration _makePageInputDecoration(String labelText) {
    return InputDecoration(
        labelText: labelText,
        labelStyle: context.textTheme.bodySmall,
        filled: true,
        fillColor: LightColor.secondaryBackgroundColor);
  }
}
