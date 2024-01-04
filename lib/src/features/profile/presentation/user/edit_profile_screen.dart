import 'dart:io';
import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/email_field.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/baato_text_field.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/phone_number_field.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants/managers/font_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  // static const String routeName = '/user-profile-edit';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _form = GlobalKey<FormState>();
  // final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _phoneController = TextEditingController();
  // final _liscenseNumberController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _liscenseNumberFocusNode = FocusNode();

  String profileImage = 'assets/images/no-profile.png';
  File? imageFile;

  Future<void> _pickProfileImage(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(
      imageQuality: 80, source: source, // Adjust the image quality as desired
    );
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
      // setState(() {
      //   profileImage = imageFile.path;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p12,
            horizontal: AppPadding.p8,
          ),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  if (imageFile != null)
                    CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(imageFile as File))
                  else
                    CircleAvatar(
                        radius: 70, backgroundImage: AssetImage(profileImage)),
                  Positioned(
                    right: -15.0.doubleHardcoded(),
                    bottom: AppMargin.m16,
                    child: IconButton(
                      onPressed: () {
                        final cameraOption = ListTile(
                            title: Text(
                              'Take a picture',
                              style: const TextStyle().copyWith(
                                fontSize: FontSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              _pickProfileImage(ImageSource.camera);
                            });
                        final galleryOption = ListTile(
                            title: Text(
                              'Select from Gallery',
                              style: const TextStyle().copyWith(
                                fontSize: FontSize.s16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              _pickProfileImage(ImageSource.gallery);
                            });

                        ToastHelper.showCenterAlertWithListOptions(
                            context, [cameraOption, galleryOption]);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: AppHeight.h14,
              ),
              Form(
                key: _form,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BaatoTextField(
                        initialValue: 'Krishna Rimal',
                        labelText: 'Full Name',
                        focusNode: _nameFocusNode,
                        nextFocusNode: _emailFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide your full name';
                          }
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: EmailField(
                              initialValue: 'mail@test.com',
                              labelText: 'Your email',
                              focusNode: _emailFocusNode,
                              nextFocusNode: _phoneFocusNode,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PhoneNumberField(
                              initialValue: '9736472839',
                              focusNode: _phoneFocusNode,
                              labelText: 'Your mobile number',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BaatoTextField(
                        initialValue: "345432",
                        // controller: _liscenseNumberController,
                        focusNode: _liscenseNumberFocusNode,
                        labelText: 'Your liscence number',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide your liscence number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SubmitButton(
                          label: 'Update profile', onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
