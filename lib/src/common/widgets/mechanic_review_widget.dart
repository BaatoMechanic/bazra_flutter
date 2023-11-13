import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';

class MechanicReviewWidget extends StatelessWidget {
  const MechanicReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
          border: isDarkTheme
              ? Border.all(color: ThemeColor.lightGrey)
              : Border.all(color: ThemeColor.grey),
          color:
              isDarkTheme ? ThemeColor.transparent : ColorManager.primaryTint60,
          borderRadius: BorderRadius.circular(AppRadius.r8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: AppHeight.h20,
                      child: Image.asset(
                        'assets/images/no-profile.png',
                        width: 30.0.doubleHardcoded(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Krishna Rimal',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Row(
                            children: [
                              for (var i = 0; i < 3; i++)
                                Icon(Icons.star,
                                    size: AppSize.s16,
                                    color: Theme.of(context).primaryColor),
                              for (var i = 0; i < 2; i++)
                                Icon(Icons.star_outline,
                                    size: AppSize.s16,
                                    color: Theme.of(context).primaryColor),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text('2 days ago'.hardcoded()),
            ],
          ),
          const SizedBox(
            height: AppHeight.h8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              'Hello This is about Krishna who is a trained and professional mechanic with more dthan 10 years of experience',
              style: !isDarkTheme
                  ? Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: ThemeColor.dark)
                  : Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
