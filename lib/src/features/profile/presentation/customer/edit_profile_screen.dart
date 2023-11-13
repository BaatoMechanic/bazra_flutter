import 'dart:io';
import 'package:bato_mechanic/src/common/widgets/form_fields/email_field.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/baato_text_field.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/phone_number_field.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

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
        child: Container(
          padding: const EdgeInsets.only(top: AppPadding.p12),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 70,
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(),
                onPressed: () {},
                child: const Text('From Gallery'),
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
