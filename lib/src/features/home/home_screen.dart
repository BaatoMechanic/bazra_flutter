import 'package:bato_mechanic/src/common/widgets/inplace_carousel_widget.dart';
import 'package:bato_mechanic/src/common/widgets/recent_repair_container_widget.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/home/tips_carousel.dart';
import 'package:bato_mechanic/src/features/menu/user_profile_menu.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';

import 'service_buttons_grid.dart';
import 'service_type_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController _searchTextController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: UserProfileMenu(),
        ),
        appBar: AppBar(
          elevation: AppHeight.h0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: AppPadding.p8),
              child: CircleAvatar(
                child: Image.asset('assets/images/no-profile.png'.hardcoded()),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: AppHeight.h150,
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p12,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: AppHeight.h40,
                    child: SearchBar(
                      controller: _searchTextController,
                      focusNode: _searchFocusNode,
                      leading: Icon(Icons.search),
                      onChanged: (value) {
                        _searchTextController.text = value;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: AppPadding.p24),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: AppHeight.h14,
                          ),
                          TipsCarousel(),
                          SizedBox(
                            height: AppHeight.h20,
                          ),
                          ServiceButtonsGrid(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
