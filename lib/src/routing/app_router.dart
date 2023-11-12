import 'dart:developer';
import 'dart:io';

import 'package:bato_mechanic/src/utils/data_types/string_or_audio.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/auth/presentation/login/login_screen.dart';
import 'package:bato_mechanic/src/features/auth/presentation/signup/signup_screen.dart';
import 'package:bato_mechanic/src/features/feedback_and_contact/presentation/feedback_and_contact_screen.dart';
import 'package:bato_mechanic/src/features/history/presentation/service_history_screen.dart';
import 'package:bato_mechanic/src/features/home/home_screen.dart';
import 'package:bato_mechanic/src/features/payment/presentation/payment_integration_screen.dart';
import 'package:bato_mechanic/src/features/profile/presentation/mechanic_profile_screen.dart';
import 'package:bato_mechanic/src/features/recent_repairs/recent_repairs_list.dart';
import 'package:bato_mechanic/src/features/repair_progress/repair_progress_screen.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/request_mechanic_screen.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/track_mechanic/track_mechanic_screen.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_parts/vehicle_parts_screen.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicles/vehicles_screen.dart';
import 'package:bato_mechanic/src/features/review/review_mechanic_screen.dart';
import 'package:bato_mechanic/src/features/splash/presentation/splash_screen.dart';
import 'package:bato_mechanic/src/features/support_chat/presentation/support_chat_screen.dart';

import 'package:go_router/go_router.dart';

import '../../temp.dart';
import '../common/widgets/inplace_carousel_widget.dart';
import '../features/repair_request/presentation/vehicle_categories/vehicle_category_screen.dart';

enum appRoute {
  categories,
  vehicles,
  parts,
  requestMechanic,
  auth,
  feedback,
  history,
  payment,
  mechanicProfile,
  reviewMechanic,
  splash,
  trackMechanic,
  supportChat,
  repairProgress,
  recentRepairs,
  home,
  login,
  signup,
  ReviewMechanic,
}

final repairSteps = [
  RepairStep(
      name: 'Inception',
      detail: AudioData(File('audios/sample_audio.mp3')),
      status: 'Completed',
      report: RepairStepReport(reportFields: [])),
  RepairStep(
      name: 'Step 2 details',
      detail: StringData("Did the inception"),
      status: 'In Progress'),
  // Add more steps as needed
];

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: appRoute.splash.name,
        builder: (context, state) => SplashScreen(),
        routes: [
          GoRoute(
            path: 'login',
            name: appRoute.login.name,
            builder: (context, state) => LoginScreen(),
          ),
          GoRoute(
            path: 'signup',
            name: appRoute.signup.name,
            builder: (context, state) => SignUpScreen(),
          ),
          GoRoute(
            path: 'track_mechanic',
            name: appRoute.trackMechanic.name,
            builder: (context, state) => const TrackMechanicScreen(),
            routes: [
              GoRoute(
                path: 'payment',
                name: appRoute.payment.name,
                builder: (context, state) => const PaymentIntegrationScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'home',
            name: appRoute.home.name,
            builder: (context, state) => HomeScreen(),
            routes: [
              GoRoute(
                path: 'support-chat',
                name: appRoute.supportChat.name,
                builder: (context, state) => const SupportChatScreen(),
              ),
              GoRoute(
                path: 'recent_repairs',
                name: appRoute.recentRepairs.name,
                builder: (context, state) => const RecentRepairsList(),
              ),
              GoRoute(
                path: 'repair_progress',
                name: appRoute.repairProgress.name,
                builder: (context, state) =>
                    RepairProgressScreen(repairSteps: repairSteps),
                routes: [
                  GoRoute(
                    path: 'review_mechanic',
                    name: appRoute.ReviewMechanic.name,
                    builder: (context, state) => ReviewMechanicScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'mechanic-profile',
                name: appRoute.mechanicProfile.name,
                builder: (context, state) => MechanicProfileScreen(),
              ),
              GoRoute(
                path: 'feedback',
                name: appRoute.feedback.name,
                builder: (context, state) => const FeedbackContactScreen(),
              ),
              GoRoute(
                path: 'categories',
                name: appRoute.categories.name,
                builder: (context, state) => const VehicleCategoryScreen(),
                routes: [
                  GoRoute(
                    path: 'vehicles',
                    name: appRoute.vehicles.name,
                    builder: (context, state) => const VehiclesScreen(),
                    routes: [
                      GoRoute(
                        path: 'parts',
                        name: appRoute.parts.name,
                        builder: (context, state) => const VehiclePartsScreen(),
                        routes: [
                          GoRoute(
                            path: 'request',
                            name: appRoute.requestMechanic.name,
                            builder: (context, state) =>
                                const RequestMechanicScreen(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
