import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shamel_fibo/features/Auth/presentation/Views/screens/loginScreen.dart';
import 'package:shamel_fibo/features/Auth/presentation/Views/screens/registerScreen.dart';
import 'package:shamel_fibo/features/Home/data/models/product_model.dart';
import 'package:shamel_fibo/features/Home/presentation/screens/details_screen.dart';
import 'package:shamel_fibo/features/Home/presentation/screens/home_screen.dart';
import 'package:shamel_fibo/features/cart/presentation/views/screens/cartScreen.dart';
import 'package:shamel_fibo/features/search/presentation/view_model/cubit/views/screens/search_screen.dart';
import 'package:shamel_fibo/features/splash.dart';
import 'package:shamel_fibo/features/WelcomeScreen.dart';

class RouterGeneration {
  static const String splash = "/splash";
  static const String home = "/home";
  static const String login = "/login";
  static const String welcome = "/welcome";
  static const String register = "/register";
  static const String details = "/details";
  static const String cart = "/cart";
    static const String search = "/search";


  static GoRouter goRouter = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: welcome,
        builder: (context, state) {
          return Welcomescreen();
        },
      ),

      GoRoute(
        path: home,
        builder: (context, state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: cart,
        builder: (context, state) {
          return Cartscreen();
        },
      ),
      GoRoute(
        path: register,
        builder: (context, state) {
          return Registerscreen();
        },
      ),
      GoRoute(
        path: login,
        builder: (context, state) {
          return Loginscreen();
        },
      ),
      GoRoute(
        path: search,
        builder: (context, state) {
          return SearchScreen();
        },
      ),
      GoRoute(
        path: details,
        builder: (context, state) {
          ProductModel product= state.extra as ProductModel;
          return DetailsScreen(productModel: product,);
        },
      ),
    ],
    debugLogDiagnostics: true,
    errorPageBuilder:
        (context, state) => MaterialPage(
          child: Scaffold(body: Center(child: Text("Page Not Found"))),
        ),
  );
}
