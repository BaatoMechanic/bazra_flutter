import 'dart:developer';
import 'dart:io';

import 'package:bato_mechanic/src/features/password_change/presentation/change_password_screen.dart';
import 'package:bato_mechanic/src/features/password_change/presentation/old_password_confirmation_screen.dart';
import 'package:bato_mechanic/src/features/password_change/presentation/otp_confirmation_screen.dart';
import 'package:bato_mechanic/src/features/profile/presentation/user/user_profile_screen.dart';
import 'package:bato_mechanic/src/features/profile/presentation/user/edit_profile_screen.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/presentation/screens/mechanic_reviews_list_screen/mechanic_reviews_list_screen.dart';
import 'package:bato_mechanic/src/utils/data_types/string_or_audio.dart';
import 'package:bato_mechanic/src/utils/enums/otp_type.dart';
import 'package:bato_mechanic/src/utils/enums/repair_setp_status.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/auth/presentation/login/login_screen.dart';
import 'package:bato_mechanic/src/features/auth/presentation/signup/signup_screen.dart';
import 'package:bato_mechanic/src/features/feedback_and_contact/presentation/feedback_and_contact_screen.dart';
import 'package:bato_mechanic/src/features/history/presentation/service_history_screen.dart';
import 'package:bato_mechanic/src/features/home/presentation/screen/home_screen.dart';
import 'package:bato_mechanic/src/features/payment/presentation/screens/payment_integration_screen.dart';
import 'package:bato_mechanic/src/features/profile/presentation/mechanic/mechanic_profile_screen.dart';
import 'package:bato_mechanic/src/features/recent_repairs/recent_repairs_list.dart';
import 'package:bato_mechanic/src/features/repair_progress/presentation/screen/repair_progress_screen.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/request_mechanic_screen.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_parts/vehicle_parts_screen.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicles/vehicles_screen.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/presentation/screens/review_mechanic_screen/review_mechanic_screen.dart';
import 'package:bato_mechanic/src/features/splash/presentation/splash_screen.dart';
import 'package:bato_mechanic/src/features/support_chat/presentation/support_chat_screen.dart';

import 'package:go_router/go_router.dart';

import '../../temp.dart';
import '../common/widgets/inplace_carousel_widget.dart';
import '../features/repair_progress/domain/repair_step.dart';
import '../features/repair_progress/domain/repair_step_report.dart';
import '../features/repair_request/presentation/vehicle_categories/vehicle_category_screen.dart';
import '../features/track_mechanic/presentation/track_mechanic_screen.dart';

enum APP_ROUTE {
  categories,
  vehicles,
  parts,
  requestMechanic,
  auth,
  feedback,
  history,
  payment,
  mechanicProfile,
  customerProfile,
  editProfile,
  reviewMechanic,
  splash,
  trackMechanic,
  supportChat,
  repairProgress,
  recentRepairs,
  buildHome,
  home,
  login,
  signup,
  mechanicReviewsList,
  confirmOldPassword,
  confirmOTP,
  changePassword,
}

// final repairSteps = [
//   RepairStep(
//       name: 'Inception',
//       detail: AudioData(File('audios/sample_audio.mp3')),
//       status: RepairStepStatus.COMPLETED,
//       report: RepairStepReport(reportFields: [
//         {
//           "bill_images": [
//             "assets/images/parts/body.png",
//             "assets/images/parts/wheel.png",
//             "assets/images/vehicle/jcb.png",
//           ]
//         }
//       ])),
//   RepairStep(
//     name: 'Step 2 details',
//     detail: StringData("Did the inception"),
//     status: RepairStepStatus.PENDING,
//   ),
//   // Add more steps as needed
// ];

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      // GoRoute(
      //   path: '/',
      //   name: appRoute.home.name,
      //   // builder: (context, state) => HomeScreen(),
      //   builder: (context, state) => BuildHomeScreen(),
      // ),

      GoRoute(
          path: '/login',
          name: APP_ROUTE.login.name,
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'signup',
              name: APP_ROUTE.signup.name,
              builder: (context, state) => SignUpScreen(),
            ),
          ]),

      GoRoute(
        path: '/',
        name: APP_ROUTE.home.name,
        // builder: (context, state) => HomeScreen(),
        // builder: (context, state) => BuildHomeScreen(),
        builder: (context, state) => RepairProgressScreen(
          repairRequestIdx: "NqCYPG6oX2jrjsePXZg42Z",
        ),

        routes: [
          GoRoute(
            path: 'track_mechanic',
            name: APP_ROUTE.trackMechanic.name,
            builder: (context, state) => const TrackMechanicScreen(),
            routes: [
              GoRoute(
                path: 'payment',
                name: APP_ROUTE.payment.name,
                builder: (context, state) => const PaymentIntegrationScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'confirm-old-password',
            name: APP_ROUTE.confirmOldPassword.name,
            builder: (context, state) => ConfirmOldPasswordScreen(),
            routes: [
              GoRoute(
                path: 'confirm-top',
                name: APP_ROUTE.confirmOTP.name,
                builder: (context, state) => OTPConfirmationScreen(
                  otpType: OTPType.EMAIL,
                ),
                routes: [
                  GoRoute(
                    path: 'change-password',
                    name: APP_ROUTE.changePassword.name,
                    builder: (context, state) => ChangePasswordScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'support-chat',
            name: APP_ROUTE.supportChat.name,
            builder: (context, state) => const SupportChatScreen(),
          ),
          GoRoute(
            path: 'recent_repairs',
            name: APP_ROUTE.recentRepairs.name,
            builder: (context, state) => const RecentRepairsList(),
          ),
          GoRoute(
            path: 'repair_progress',
            name: APP_ROUTE.repairProgress.name,
            builder: (context, state) {
              final repairRequestIdx = (state.extra as Map)["repairRequestIdx"];

              return RepairProgressScreen(
                  repairRequestIdx:
                      repairRequestIdx ?? "NqCYPG6oX2jrjsePXZg42Z");
            },
            routes: [
              GoRoute(
                path: 'review_mechanic',
                name: APP_ROUTE.reviewMechanic.name,
                builder: (context, state) => ReviewMechanicScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'mechanic-profile',
            name: APP_ROUTE.mechanicProfile.name,
            builder: (context, state) {
              final mechanicIdx = (state.extra as Map)["mechanicIdx"];
              return MechanicProfileScreen(
                mechanicIdx: mechanicIdx ?? '4ebFHe3UfuBLr9WbEroijH',
              );
            },
          ),
          GoRoute(
            path: 'customer-profile',
            name: APP_ROUTE.customerProfile.name,
            builder: (context, state) => UserProfileScreen(),
          ),
          GoRoute(
            path: 'edit-profile',
            name: APP_ROUTE.editProfile.name,
            builder: (context, state) => EditProfileScreen(),
          ),
          GoRoute(
            path: 'feedback',
            name: APP_ROUTE.feedback.name,
            builder: (context, state) => const FeedbackContactScreen(),
          ),
          GoRoute(
            path: 'categories',
            name: APP_ROUTE.categories.name,
            builder: (context, state) => const VehicleCategoryScreen(),
            routes: [
              GoRoute(
                path: 'vehicles',
                name: APP_ROUTE.vehicles.name,
                builder: (context, state) => const VehiclesScreen(),
                routes: [
                  // GoRoute(
                  //   path: 'parts',
                  //   name: appRoute.parts.name,
                  //   builder: (context, state) => const VehiclePartsScreen(),
                  //   routes: [
                  //     GoRoute(
                  //       path: 'request',
                  //       name: appRoute.requestMechanic.name,
                  //       builder: (context, state) =>
                  //           const RequestMechanicScreen(),
                  //     ),
                  //   ],
                  // ),
                  GoRoute(
                    path: 'request',
                    name: APP_ROUTE.requestMechanic.name,
                    builder: (context, state) => const RequestMechanicScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
              path: 'mechanic-reviews',
              name: APP_ROUTE.mechanicReviewsList.name,
              builder: (context, state) {
                final mechanicIdx = (state.extra as Map)["mechanicIdx"];
                return MechanicReviewsListScreen(
                    mechanicIdx: mechanicIdx ?? '4ebFHe3UfuBLr9WbEroijH');
              }),
        ],
      ),

      // GoRoute(
      //   path: '/home',
      //   name: appRoute.home.name,
      //   // builder: (context, state) => HomeScreen(),
      //   builder: (context, state) => BuildHomeScreen(),
      //   routes: [
      //     GoRoute(
      //       path: 'track_mechanic',
      //       name: appRoute.trackMechanic.name,
      //       builder: (context, state) => const TrackMechanicScreen(),
      //       routes: [
      //         GoRoute(
      //           path: 'payment',
      //           name: appRoute.payment.name,
      //           builder: (context, state) => const PaymentIntegrationScreen(),
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       path: 'confirm-old-password',
      //       name: appRoute.confirmOldPassword.name,
      //       builder: (context, state) => ConfirmOldPasswordScreen(),
      //       routes: [
      //         GoRoute(
      //           path: 'confirm-top',
      //           name: appRoute.confirmOTP.name,
      //           builder: (context, state) => OTPConfirmationScreen(
      //             otpType: OTPType.EMAIL,
      //           ),
      //           routes: [
      //             GoRoute(
      //               path: 'change-password',
      //               name: appRoute.changePassword.name,
      //               builder: (context, state) => ChangePasswordScreen(),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       path: 'support-chat',
      //       name: appRoute.supportChat.name,
      //       builder: (context, state) => const SupportChatScreen(),
      //     ),
      //     GoRoute(
      //       path: 'recent_repairs',
      //       name: appRoute.recentRepairs.name,
      //       builder: (context, state) => const RecentRepairsList(),
      //     ),
      //     GoRoute(
      //       path: 'repair_progress',
      //       name: appRoute.repairProgress.name,
      //       builder: (context, state) =>
      //           RepairProgressScreen(repairSteps: repairSteps),
      //       routes: [
      //         GoRoute(
      //           path: 'review_mechanic',
      //           name: appRoute.ReviewMechanic.name,
      //           builder: (context, state) => ReviewMechanicScreen(),
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       path: 'mechanic-profile',
      //       name: appRoute.mechanicProfile.name,
      //       builder: (context, state) {
      //         final mechanicIdx = (state.extra as Map)["mechanicIdx"];
      //         return MechanicProfileScreen(
      //           mechanicIdx: mechanicIdx ?? '4ebFHe3UfuBLr9WbEroijH',
      //         );
      //       },
      //     ),
      //     GoRoute(
      //       path: 'customer-profile',
      //       name: appRoute.customerProfile.name,
      //       builder: (context, state) => UserProfileScreen(),
      //     ),
      //     GoRoute(
      //       path: 'edit-profile',
      //       name: appRoute.editProfile.name,
      //       builder: (context, state) => EditProfileScreen(),
      //     ),
      //     GoRoute(
      //       path: 'feedback',
      //       name: appRoute.feedback.name,
      //       builder: (context, state) => const FeedbackContactScreen(),
      //     ),
      //     GoRoute(
      //       path: 'categories',
      //       name: appRoute.categories.name,
      //       builder: (context, state) => const VehicleCategoryScreen(),
      //       routes: [
      //         GoRoute(
      //           path: 'vehicles',
      //           name: appRoute.vehicles.name,
      //           builder: (context, state) => const VehiclesScreen(),
      //           routes: [
      //             // GoRoute(
      //             //   path: 'parts',
      //             //   name: appRoute.parts.name,
      //             //   builder: (context, state) => const VehiclePartsScreen(),
      //             //   routes: [
      //             //     GoRoute(
      //             //       path: 'request',
      //             //       name: appRoute.requestMechanic.name,
      //             //       builder: (context, state) =>
      //             //           const RequestMechanicScreen(),
      //             //     ),
      //             //   ],
      //             // ),
      //             GoRoute(
      //               path: 'request',
      //               name: appRoute.requestMechanic.name,
      //               builder: (context, state) => const RequestMechanicScreen(),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //         path: 'mechanic-reviews',
      //         name: appRoute.mechanicReviewsList.name,
      //         builder: (context, state) {
      //           final mechanicIdx = (state.extra as Map)["mechanicIdx"];
      //           return MechanicReviewsListScreen(
      //               mechanicIdx: mechanicIdx ?? '4ebFHe3UfuBLr9WbEroijH');
      //         }),
      //   ],
      // ),
    ],
  );
}
