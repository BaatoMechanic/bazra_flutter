import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/font_manager.dart';
import '../../utils/constants/managers/style_manager.dart';
import '../../utils/constants/managers/values_manager.dart';

class BillingInfoWidget extends StatefulWidget {
  BillingInfoWidget({Key? key}) : super(key: key);

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
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.p16,
            horizontal: AppPadding.p14,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----------------------    Name section starts here -----------------------------------

              Container(
                padding: EdgeInsets.symmetric(
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
                    SizedBox(
                      height: AppHeight.h4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: Colors.grey,
                          //   width: 1.0,
                          //   style: BorderStyle.solid,
                          // ),
                          ),
                      child: Column(
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
                                          // initialValue: _userProvider
                                          //         .bookProvider.billingInfo
                                          //         .containsKey('first_name')
                                          //     ? _userProvider.bookProvider
                                          //         .billingInfo['first_name']
                                          //     : null,
                                          initialValue: 'Krishna Rimal',
                                          cursorColor:
                                              Theme.of(context).primaryColor,
                                          // focusNode: _userProvider
                                          //     .billingInfoViewModelFirstNameFocusNode,
                                          decoration: InputDecoration(
                                            labelText: 'First Name',
                                            focusColor: Colors.redAccent,
                                          ),
                                          textInputAction: TextInputAction.next,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          onFieldSubmitted: (_) {
                                            // FocusScope.of(context)
                                            //     .requestFocus(_userProvider
                                            //         .billingInfoViewModelLastNameFocusNode);
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please provide the first name';
                                            }
                                            return null;
                                          },
                                          // onSaved: (value) {
                                          //   _userProvider.bookProvider
                                          //           .billingInfo['first_name'] =
                                          //       value.toString();
                                          // }
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          // initialValue: _userProvider
                                          //         .bookProvider.billingInfo
                                          //         .containsKey('last_name')
                                          //     ? _userProvider.bookProvider
                                          //         .billingInfo['last_name']
                                          //     : null,
                                          keyboardType: TextInputType.text,
                                          cursorColor:
                                              Theme.of(context).primaryColor,
                                          // focusNode: _userProvider
                                          //     .billingInfoViewModelLastNameFocusNode,
                                          decoration: InputDecoration(
                                            labelText: 'Last Name',
                                          ),
                                          textInputAction: TextInputAction.next,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          onFieldSubmitted: (_) {
                                            // FocusScope.of(context).requestFocus(
                                            //     _userProvider
                                            //         .billingInfoViewModelEmailFocusNode);
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please provide the last name';
                                            }
                                            return null;
                                          },
                                          // onSaved: (value) {
                                          //   _userProvider.bookProvider
                                          //           .billingInfo['last_name'] =
                                          //       value.toString();
                                          // },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    // initialValue: _userProvider
                                    //         .bookProvider.billingInfo
                                    //         .containsKey('email')
                                    //     ? _userProvider
                                    //         .bookProvider.billingInfo['email']
                                    //     : null,
                                    // focusNode: _userProvider
                                    //     .billingInfoViewModelEmailFocusNode,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(
                                      labelText: 'Email Address',
                                    ),
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode: AutovalidateMode.always,
                                    onFieldSubmitted: (_) {
                                      // FocusScope.of(context).requestFocus(
                                      //     _userProvider
                                      //         .billingInfoViewModelPhoneNumberFocusNode);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please provide email to receive notifications';
                                      }
                                      return null;
                                    },
                                    // onSaved: (value) {
                                    //   _userProvider.bookProvider
                                    //           .billingInfo['email'] =
                                    //       value.toString();
                                    // }
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    // initialValue: _userProvider
                                    //         .bookProvider.billingInfo
                                    //         .containsKey('phone')
                                    //     ? _userProvider
                                    //         .bookProvider.billingInfo['phone']
                                    //     : null,
                                    // focusNode: _userProvider
                                    //     .billingInfoViewModelPhoneNumberFocusNode,
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                    ),
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode: AutovalidateMode.always,
                                    onFieldSubmitted: (_) {
                                      // FocusScope.of(context).requestFocus(
                                      //     _userProvider
                                      //         .billingInfoViewModelSideNoteFocusNode);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please provide the phone number to be contacted';
                                      }
                                      return null;
                                    },
                                    // onSaved: (value) {
                                    //   _userProvider.bookProvider
                                    //           .billingInfo['phone'] =
                                    //       value.toString();
                                    // }
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    // initialValue: _edittedUser.description,
                                    // focusNode: _userProvider
                                    //     .billingInfoViewModelSideNoteFocusNode,
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(
                                      labelText: 'Side Note',
                                    ),
                                    textInputAction: TextInputAction.newline,
                                    autovalidateMode: AutovalidateMode.always,
                                    minLines: 3,
                                    maxLines: 7,

                                    // onSaved: (value) {
                                    //   _userProvider.bookProvider
                                    //           .billingInfo['side_note'] =
                                    //       value.toString();
                                    // },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ----------------------    Name section ends here -----------------------------------
              // ----------------------    Sort by locations section ends here -----------------------------------
              Container(
                padding: EdgeInsets.symmetric(
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
                    SizedBox(
                      height: AppHeight.h4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      )),
                      // child: DropdownButtonHideUnderline(
                      // child: DropdownButton(
                      //     isExpanded: true,
                      //     style: getBoldStyle(
                      //         color: ColorManager.primaryShade100),
                      //     // value: _userProvider.bookProvider
                      //     //     .billingInfo['convenient_location'],
                      //     // value: _locationOptions[0],
                      //     items: _userProvider.bookProvider.locationOptions
                      //         .map((option) => DropdownMenuItem(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.only(
                      //                   left: AppPadding.p12,
                      //                 ),
                      //                 child: Text(
                      //                   option,
                      //                 ),
                      //               ),
                      //               value: option,
                      //             ))
                      //         .toList(),
                      //     onChanged: (value) {
                      //       setState(() {
                      //         _userProvider.bookProvider
                      //                 .billingInfo['convenient_location'] =
                      //             value as String;
                      //       });
                      //     }),
                      // ),
                    ),
                  ],
                ),
              ),
              // ----------------------    Sort by location section ends here -----------------------------------
              // ----------------------    Payment gateway section starts here -----------------------------------

              Padding(
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
                  backgroundColor:

                      // ColorManager.green,
                      Colors.green,
                  fixedSize: Size.fromWidth(
                    MediaQuery.of(context).size.width,
                  ),
                ),
                onPressed: () async {
                  // setState(() {
                  // _userProvider.billingInfoViewModelPaymentMethod =
                  //     PaymentMethod.Esewa;
                  // });
                },
                child: Text("Pay with e-Sewa"),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:

                      // ColorManager.lighterGrey,
                      Colors.grey,
                  fixedSize: Size.fromWidth(
                    MediaQuery.of(context).size.width,
                  ),
                ),
                onPressed: () async {
                  // _payWithKhalti();
                  // setState(() {
                  //   _userProvider.billingInfoViewModelPaymentMethod =
                  //       PaymentMethod.Khalti;
                  // });
                },
                child: Text("Pay with Khalti"),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:

                      // ColorManager.lighterGrey,
                      Colors.grey,
                  fixedSize: Size.fromWidth(
                    MediaQuery.of(context).size.width,
                  ),
                ),
                onPressed: () async {
                  // setState(() {
                  //   _userProvider.billingInfoViewModelPaymentMethod =
                  //       PaymentMethod.Cash;
                  // });
                  // Initiate Ewsea payment
                  // EwseaResult result = await Ewsea.initializePayment(
                  //   "your-ewsea-key",
                  //   100.0, // payment amount
                  //   "USD", // currency code
                  // );

                  // // Handle payment response
                  // if (result.success) {
                  //   setState(() {
                  //     paymentGateway = "Ewsea";
                  //   });
                  // } else {
                  //   // Handle payment error
                  // }
                },
                child: Text("Pay with Cash"),
              ),

              // ----------------------    Payment gateway section ends here -----------------------------------

              SizedBox(
                height: AppHeight.h50,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: AppHeight.h60,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              // color: ColorManager.lighterGrey,
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
          vertical: AppPadding.p8,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
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
