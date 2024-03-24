import 'dart:io';
import 'package:bato_mechanic/src/features/auth/application/auth_state.dart';
import 'package:bato_mechanic/src/features/profile/presentation/user/edit_profile/edit_profile_screen_controller.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/shared/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/shared/widgets/form_fields/email_field.dart';
import 'package:bato_mechanic/src/shared/widgets/form_fields/baato_text_field.dart';
import 'package:bato_mechanic/src/shared/widgets/form_fields/phone_number_field.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/shared/utils/helpers/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../shared/domain/user.dart';
import '../../../../../shared/utils/constants/managers/font_manager.dart';
import '../../../../../shared/utils/constants/managers/values_manager.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({required this.user, Key? key}) : super(key: key);
  final User user;

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  String profileImage = 'assets/images/no-profile.png'.hardcoded();
  File? imageFile;

  final _form = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _liscenseNumberController;

  late FocusNode _nameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _liscenseNumberFocusNode;

  Future<void> _pickProfileImage(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(
      imageQuality: 80, source: source, // Adjust the image quality as desired
    );
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  _updateProfile() async {
    if (_form.currentState!.validate()) {
      final bool nameUpdated = _nameController.text != widget.user.name;
      final bool emailUpdated = _emailController.text != widget.user.email;
      final bool phoneUpdated = _phoneController.text != widget.user.phone;
      // final bool liscenseNumberUpdated = _liscenseNumberController.text != widget.user.licenseNumber;
      final bool liscenseNumberUpdated = false;
      Map<String, dynamic> data = <String, dynamic>{};
      if (nameUpdated) {
        data["name"] = _nameController.text;
      }
      if (emailUpdated) {
        data["email"] = _emailController.text;
      }
      if (phoneUpdated) {
        data["phone"] = _phoneController.text;
      }
      if (liscenseNumberUpdated) {
        data["license_Number"] = _liscenseNumberController.text;
      }

      if (await ref
          .read(editProfileScreenControllerProvider.notifier)
          .updateProfile(data)) {
        context.pop();
        ToastHelper.showNotification(
            context, "Profile updated successfully".hardcoded());
      } else {
        ToastHelper.showNotification(
            context, "Failed to update profile".hardcoded());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
    // _liscenseNumberController = TextEditingController(text: widget.user.licenseNumber);
    _liscenseNumberController = TextEditingController(text: "3396");

    // _liscenseNumberController.text = widget.user.licenseNumber ?? "";

    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _liscenseNumberFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _liscenseNumberController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _liscenseNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        controller: _nameController,
                        // editable: false,
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
                              controller: _emailController,
                              // editable: _emailController.text.isEmpty,
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
                              controller: _phoneController,
                              // editable: _phoneController.text.isEmpty,
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
                          label: 'Update profile', onPressed: _updateProfile),
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
