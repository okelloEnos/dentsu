import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../../common_widgets/common_widget_barrel.dart';
import '../../features/log_in/login_barrel.dart';
import '../../features/features_barrel.dart';
import '../../main.dart';
import '../util_barrel.dart';


/// app route configuration
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    // outside the app
    GoRoute(
      path: '/',
      name: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'login',
          name: 'login',
            pageBuilder: (context, state) => pageBuilderWithTransition(
                context: context,
                state: state,
                duration: pageTransitionValue,
                transitionType: PageTransitionType.rightToLeft,
                child: const LogInScreen()),
          routes: const [
            // GoRoute(
            //   path: 'forgot_password',
            //   name: 'forgot_password',
            //   pageBuilder: (context, state) => pageBuilderWithTransition(
            //       context: context,
            //       state: state,
            //       duration: pageTransitionValue,
            //       transitionType: PageTransitionType.rightToLeft,
            //       child: const ForgotPasswordScreen()),
            //   routes: [
            //     GoRoute(
            //       path: 'verify_otp',
            //       name: 'verify_otp',
            //         pageBuilder: (context, state) {
            //         Map stateMap = state.extra as Map;
            //           var phoneNumber = stateMap["phone_number"];
            //           return  pageBuilderWithTransition(
            //               context: context,
            //               state: state,
            //               duration: pageTransitionValue,
            //               transitionType: PageTransitionType.rightToLeft,
            //               child: VerifyOtpScreen(phoneNumber: phoneNumber ?? "",));
            //         },
            //       routes: [
            //         GoRoute(
            //           path: 'new_password',
            //           name: 'new_password',
            //           pageBuilder: (context, state) {
            //             Map stateMap = state.extra as Map;
            //             var phoneNumber = stateMap["phone_number"];
            //             var otp = stateMap["otp"];
            //
            //             return  pageBuilderWithTransition(
            //                 context: context,
            //                 state: state,
            //                 duration: pageTransitionValue,
            //                 transitionType: PageTransitionType.rightToLeft,
            //                 child: NewPasswordScreen(phoneNumber: phoneNumber ?? "", otp: otp ?? "",));
            //           },
            //         ),
            //       ]
            //     ),
            //   ],
            // ),
          ]
        ),

      ]
    ),
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      pageBuilder: (context, state) => pageBuilderWithTransition(
          context: context,
          state: state,
          duration: 2000,
          transitionType: PageTransitionType.bottomToTop,
          child: const DashboardScreen()),
      routes: const [
        // GoRoute(
        //   path: 'change_pin',
        //   name: 'change_pin',
        //   pageBuilder: (context, state) => pageBuilderWithTransition(
        //       context: context,
        //       state: state,
        //       duration: pageTransitionValue,
        //       transitionType: PageTransitionType.rightToLeft,
        //       child: const ChangePinScreen()),
        // ),
      ]
    ),
  ],
  errorBuilder: (context, state) => const RoutingErrorPage(),
);
