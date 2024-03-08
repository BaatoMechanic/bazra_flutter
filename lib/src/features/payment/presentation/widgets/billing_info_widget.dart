import 'package:flutter/material.dart';

import '../../../../utils/constants/managers/color_manager.dart';
import '../../../../utils/constants/managers/font_manager.dart';
import '../../../../utils/constants/managers/style_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';

class BillingInfoWidget extends StatefulWidget {
  const BillingInfoWidget({Key? key}) : super(key: key);

  @override
  State<BillingInfoWidget> createState() => _BillingInfoWidgetState();
}

class _BillingInfoWidgetState extends State<BillingInfoWidget> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryTint100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.cancel,
            color: ColorManager.primaryShade100,
          ),
        ),
        title: Center(
          child: Text(
            'Billing Information',
            style: getBoldStyle(
              fontSize: FontSize.s20,
            ).copyWith(
              color: ColorManager.primaryShade100,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p16,
            horizontal: AppPadding.p14,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----------------------    Name section starts here -----------------------------------

              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Billing Information',
                      style: getBoldStyle(
                        fontSize: FontSize.s18,
                      ).copyWith(
                        color: ColorManager.primaryShade100,
                      ),
                    ),
                    const SizedBox(
                      height: AppHeight.h4,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: _form,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        initialValue: 'Krishna Rimal',
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        decoration: const InputDecoration(
                                          labelText: 'First Name',
                                          focusColor: Colors.redAccent,
                                        ),
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        onFieldSubmitted: (_) {},
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please provide the first name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        decoration: const InputDecoration(
                                          labelText: 'Last Name',
                                        ),
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        onFieldSubmitted: (_) {},
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please provide the last name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: const InputDecoration(
                                    labelText: 'Email Address',
                                  ),
                                  textInputAction: TextInputAction.next,
                                  autovalidateMode: AutovalidateMode.always,
                                  onFieldSubmitted: (_) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please provide email to receive notifications';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: const InputDecoration(
                                    labelText: 'Phone Number',
                                  ),
                                  textInputAction: TextInputAction.next,
                                  autovalidateMode: AutovalidateMode.always,
                                  onFieldSubmitted: (_) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please provide the phone number to be contacted';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: const InputDecoration(
                                    labelText: 'Side Note',
                                  ),
                                  textInputAction: TextInputAction.newline,
                                  autovalidateMode: AutovalidateMode.always,
                                  minLines: 3,
                                  maxLines: 7,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // ----------------------    Name section ends here -----------------------------------
              // ----------------------    Sort by locations section ends here -----------------------------------
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: getBoldStyle(
                        fontSize: FontSize.s18,
                      ).copyWith(
                        color: ColorManager.primaryShade100,
                      ),
                    ),
                    const SizedBox(
                      height: AppHeight.h4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      )),
                    ),
                  ],
                ),
              ),
              // ----------------------    Sort by location section ends here -----------------------------------
              // ----------------------    Payment gateway section starts here -----------------------------------

              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p12,
                ),
              ),

              Text(
                'Select Payment Gateway',
                style: getBoldStyle(
                  fontSize: FontSize.s18,
                ).copyWith(
                  color: ColorManager.primaryShade100,
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size.fromWidth(
                    MediaQuery.of(context).size.width,
                  ),
                ),
                onPressed: () async {},
                child: const Text("Pay with e-Sewa"),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  fixedSize: Size.fromWidth(
                    MediaQuery.of(context).size.width,
                  ),
                ),
                onPressed: () async {},
                child: const Text("Pay with Khalti"),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  fixedSize: Size.fromWidth(
                    MediaQuery.of(context).size.width,
                  ),
                ),
                onPressed: () async {},
                child: const Text("Pay with Cash"),
              ),

              // ----------------------    Payment gateway section ends here -----------------------------------

              const SizedBox(
                height: AppHeight.h50,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: AppHeight.h60,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
          vertical: AppPadding.p8,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
