import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiking_nepal/core/constants/app_constants.dart';
import 'package:hiking_nepal/core/constants/app_media.dart';
import 'package:hiking_nepal/core/extensions/helper_extension.dart';
import 'package:hiking_nepal/core/services/date_parser_service.dart';
import 'package:hiking_nepal/core/theme/app_colors.dart';
import 'package:hiking_nepal/core/utils/gap.dart';
import 'package:hiking_nepal/core/widgets/image_picker_widget.dart';
import 'package:hiking_nepal/features/post/presentation/cubit/add_post/add_post_cubit.dart';
import 'package:hiking_nepal/features/post/presentation/widgets/custom_tile.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _costController;

  final List<String> _category = ['Not Set', 'Hike', 'Trek', 'Ride/Drive'];
  late DateTime _currentDate;

  int? selectedTime; //no of days reqd to complete the travel

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _costController = TextEditingController();
    _currentDate = DateTime.now();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _costController.dispose();
    super.dispose();
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
      body:

          ///image section
          SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: context.height * 0.3,
            width: context.width,
            child: Stack(
              children: [
                BlocBuilder<ImagePickerWidget, XFile?>(
                  builder: (context, state) {
                    return Container(
                      height: context.height * 0.25,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          image: DecorationImage(
                              image: state == null
                                  ? Image.asset(AppMedia.addPostCoverImage)
                                      .image
                                  : FileImage(File(state.path)),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: context.width * 0.39,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: CircleAvatar(
                      backgroundColor: LightColor.secondaryBackgroundColor,
                      radius: 40,
                      child: IconButton(
                        onPressed: () {
                          ///add image from gallery
                          BlocProvider.of<ImagePickerWidget>(context)
                              .pickImageFromGallery();
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

          //textform fields for name, description and costing of the travel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.pad8),
            child: Column(
              children: [
                TextFormField(
                  style: context.textTheme.bodySmall,
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  decoration: _makePageInputDecoration("Name of Destination"),
                ),
                VerticalGap.s,
                TextFormField(
                  style: context.textTheme.bodySmall,
                  controller: _descriptionController,
                  textInputAction: TextInputAction.next,
                  decoration: _makePageInputDecoration("Description"),
                ),
                VerticalGap.s,
                TextFormField(
                  style: context.textTheme.bodySmall,
                  controller: _costController,
                  keyboardType: TextInputType.number,
                  decoration: _makePageInputDecoration("Estimated Cost"),
                ),
                VerticalGap.l,

                ///category
                BlocBuilder<AddPostCubit, AddPostState>(
                  buildWhen: (previous, current) {
                    if (current is AddPostIntermediateData) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    return CustomTile(
                      iconData: Icons.category,
                      title: "Category",
                      suffix: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          alignment: AlignmentDirectional.centerEnd,
                          icon: const SizedBox.shrink(),
                          value: state.postModel?.category ?? _category[0],
                          dropdownColor: LightColor.whiteSmoke,
                          items: _category
                              .map((e) => DropdownMenuItem<String>(
                                  value: e, child: customPageText(e)))
                              .toList(),
                          onChanged: (value) {
                            BlocProvider.of<AddPostCubit>(context)
                                .editDataClass(category: value);
                          },
                        ),
                      ),
                    );
                  },
                ),
                VerticalGap.s,

                ///date
                BlocBuilder<AddPostCubit, AddPostState>(
                  buildWhen: (previous, current) {
                    if (current is AddPostIntermediateData) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    return CustomTile(
                        title: "Date",
                        iconData: Icons.calendar_today,
                        suffix: InkWell(
                          onTap: () {
                            //show date picker dialog
                            showDatePicker(
                                    context: context,
                                    initialDate: _currentDate,
                                    firstDate: _currentDate,
                                    lastDate: _currentDate
                                        .add(const Duration(days: 365)))
                                .then((value) {
                              if (value != null) {
                                //updating the state
                                BlocProvider.of<AddPostCubit>(context)
                                    .editDataClass(
                                        date: DateParserService.getDateOnly(
                                            value));
                              }
                            });
                          },
                          child: customPageText(state.postModel?.date != null
                              ? state.postModel!.date!
                              : DateParserService.getDateOnly(_currentDate)),
                        ));
                  },
                ),
                VerticalGap.l,

                //location
                CustomTile(
                    suffix: InkWell(
                        onTap: () {
                          //show field to retrieve data or show map
                        },
                        child: customPageText('Not set')),
                    title: "Location",
                    iconData: Icons.location_city_sharp),

                VerticalGap.l,

                //time (no of days to reach destination)
                BlocBuilder<AddPostCubit, AddPostState>(
                  buildWhen: (previous, current) {
                    if (current is AddPostIntermediateData) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    return CustomTile(
                        suffix: InkWell(
                          onTap: () async {
                            //select no of days reqd to reach destination
                            showCupertinoModalPopup(
                              context: context,
                              builder: (_) => Container(
                                color: LightColor.whiteSmoke,
                                width: double.infinity,
                                height: context.height * 0.25,
                                child: CupertinoPicker(
                                  itemExtent: 50, // Height of each item
                                  onSelectedItemChanged: (int index) {
                                    selectedTime = index;
                                  },
                                  children: List<Widget>.generate(10, (index) {
                                    return Center(
                                        child:
                                            customPageText(index.toString()));
                                  }),
                                ),
                              ),
                            ).then((_) {
                              //updating state
                              BlocProvider.of<AddPostCubit>(context)
                                  .editDataClass(time: selectedTime);
                            });
                          },
                          child: customPageText(state.postModel?.time != null
                              ? '${state.postModel!.time!} days'
                              : 'Not Set'),
                        ),
                        title: 'Time (Days)',
                        iconData: Icons.lock_clock);
                  },
                ),
                VerticalGap.xl,
                BlocListener<AddPostCubit, AddPostState>(
                  listener: (context, state) {
                    if (state is AddPostSuccess) {
                      print("Success bho muji");
                    }
                  },
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsetsDirectional.symmetric(
                              horizontal: context.width / 3)),
                      onPressed: () {
                        //submit the add post data to the db

                        final file =
                            BlocProvider.of<ImagePickerWidget>(context).state;

                        if (file == null) {
                          print("Image path is null");
                        } else {
                          BlocProvider.of<AddPostCubit>(context).addPost(
                              file, FirebaseAuth.instance.currentUser!.uid);
                        }
                      },
                      child: const Text("Publish")),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Text customPageText(String content) {
    return Text(content,
        style: context.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor));
  }

  InputDecoration _makePageInputDecoration(String labelText) {
    return InputDecoration(
        labelText: labelText,
        labelStyle: context.textTheme.bodySmall,
        filled: true,
        fillColor: LightColor.secondaryBackgroundColor);
  }
}
