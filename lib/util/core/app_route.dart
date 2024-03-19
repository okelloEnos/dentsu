import 'package:dentsu_test/features/leads/ui/screens/add_new_lead.dart';
import 'package:dentsu_test/features/leads/ui/screens/view_lead_details.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../../common_widgets/common_widget_barrel.dart';
import '../../features/features_barrel.dart';
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
          duration: 1000,
          transitionType: PageTransitionType.bottomToTop,
          child: const DashboardNavigationController()),
      routes: [
        GoRoute(
          path: 'view_lead',
          name: 'view_lead',
          pageBuilder: (context, state) => pageBuilderWithTransition(
              context: context,
              state: state,
              duration: pageTransitionValue,
              transitionType: PageTransitionType.rightToLeft,
              child: ViewLeadDetailsScreen(
                lead: (state.extra as Map)["lead"] as Lead,
                leadIndex: (state.extra as Map)["index"] as int,
              )),
        ),
        GoRoute(
          path: 'add_lead',
          name: 'add_lead',
          pageBuilder: (context, state) => pageBuilderWithTransition(
              context: context,
              state: state,
              duration: pageTransitionValue,
              transitionType: PageTransitionType.rightToLeft,
              child: const AddNewLeadScreen()),
        ),
        GoRoute(
          path: 'edit_lead',
          name: 'edit_lead',
          pageBuilder: (context, state) => pageBuilderWithTransition(
              context: context,
              state: state,
              duration: pageTransitionValue,
              transitionType: PageTransitionType.rightToLeft,
              child: EditLeadScreen(lead: state.extra as Lead)),
        ),
        GoRoute(
          path: 'view_quote',
          name: 'view_quote',
          pageBuilder: (context, state) => pageBuilderWithTransition(
              context: context,
              state: state,
              duration: pageTransitionValue,
              transitionType: PageTransitionType.rightToLeft,
              child: ViewQuoteScreen(quote: state.extra as Quote,)),
        ),
        GoRoute(
          path: 'add_quote',
          name: 'add_quote',
          pageBuilder: (context, state) => pageBuilderWithTransition(
              context: context,
              state: state,
              duration: pageTransitionValue,
              transitionType: PageTransitionType.rightToLeft,
              child: const AddQuoteScreen()),
        ),
      ]
    ),
  ],
  errorBuilder: (context, state) => const RoutingErrorPage(),
);
