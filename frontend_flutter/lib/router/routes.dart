import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_project/screens/home_screen.dart';
import 'package:otp_project/screens/verify_screen.dart';

final route = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/verifyEmail/:email",
      pageBuilder: (context, state) {
        final email = state.pathParameters["email"]!;
        return CustomTransitionPage(
          child: VerifyScreen(email: email), 
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);

            final offsetAnimation = animation.drive( CurveTween(curve: Curves.easeInOut)).drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      }
    )
  ]
);