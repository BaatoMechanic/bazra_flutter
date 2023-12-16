import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/description_field.dart';
import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/core/application/mechanic_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/core/data/mechanic_repository/mechanic_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class ReviewMechanicScreen extends ConsumerStatefulWidget {
  ReviewMechanicScreen({super.key});

  @override
  ConsumerState<ReviewMechanicScreen> createState() =>
      _ReviewMechanicScreenState();
}

class _ReviewMechanicScreenState extends ConsumerState<ReviewMechanicScreen> {
  final TextEditingController _reviewTextController = TextEditingController();
  final FocusNode _reviewFocusNode = FocusNode();

  int selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 280,
                      width: 260,
                      decoration: BoxDecoration(
                        color: ColorManager.primaryTint90,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppRadius.r14),
                          topRight: Radius.circular(AppRadius.r14),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/no-profile.png',
                      height: 350,
                    ),
                    Container(
                      padding: const EdgeInsets.all(AppPadding.p12),
                      decoration: BoxDecoration(
                          color: ColorManager.primaryTint40,
                          borderRadius: BorderRadius.circular(AppRadius.r8)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tyre expert'.hardcoded(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: ThemeColor.dark,
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Krishna Rimal',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: ColorManager.primaryShade100),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p8,
                                    vertical: AppPadding.p2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius:
                                        BorderRadius.circular(AppRadius.r8),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        '4.5',
                                        style: const TextStyle()
                                            .copyWith(color: ThemeColor.dark),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: ThemeColor.dark,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < selectedStars; i++)
                      IconButton(
                        onPressed: () => _setStars(i),
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              ThemeColor.transparent,
                            ),
                            iconSize:
                                MaterialStatePropertyAll<double>(FontSize.s30)),
                        icon: const Icon(
                          Icons.star,
                          color: ThemeColor.primary,
                        ),
                      ),
                    for (int i = selectedStars; i < 5; i++)
                      IconButton(
                        onPressed: () => _setStars(i),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                            ThemeColor.transparent,
                          ),
                          iconSize:
                              MaterialStatePropertyAll<double>(FontSize.s30),
                        ),
                        icon: const Icon(
                          Icons.star_outline,
                          color: ThemeColor.primary,
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                // TextField(
                //   controller: _reviewTextController,
                //   maxLines: 10,
                //   decoration: const InputDecoration(hintText: 'Write a review'),
                // ),
                DescriptionField(
                  controller: _reviewTextController,
                  focusNode: _reviewFocusNode,
                  hintText: 'Leave a review',
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                SubmitButton(
                  label: 'Submit',
                  spinnerText: "Submitting your review".hardcoded(),
                  onPressed: _submitReview,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _setStars(int i) {
    setState(() {
      selectedStars = i + 1;
    });
  }

  _submitReview() async {
    if (selectedStars == 0) {
      ToastHelper.showNotification(
        context,
        'Please select a rating'.hardcoded(),
      );
      return;
    }
    if (_reviewTextController.text.isEmpty) {
      ToastHelper.showNotification(
        context,
        'Please write a review'.hardcoded(),
      );
      return;
    }
    VehicleRepairRequest? repairRequest =
        ref.read(watchRepairRequestStateChangesProvider).value;
    if (repairRequest != null) {
      final result = await ref
          .read(mechanicServiceProvider)
          .rateAndReviewMechanic(repairRequest.idx.toString(), selectedStars,
              _reviewTextController.text);
      if (result) {
        ToastHelper.showNotification(
          context,
          'Thank you for the review'.hardcoded(),
        );
        context.goNamed(APP_ROUTE.home.name);
      } else {
        ToastHelper.showNotification(
          context,
          'Something went wrong, please try again'.hardcoded(),
        );
      }
    }
  }
}
