import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as Auth_email;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:shamel_fibo/core/routing/router_generation.dart';
import 'package:shamel_fibo/core/service_locator/service_locator.dart';
import 'package:shamel_fibo/features/Auth/presentation/view_model/login_cubit/logincubit_cubit.dart';
import 'package:shamel_fibo/features/Auth/presentation/view_model/register_cubit/cubit/register_cubit.dart';
import 'package:shamel_fibo/features/Home/presentation/cubit/home_cubit.dart';
import 'package:shamel_fibo/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:shamel_fibo/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:shamel_fibo/generated/codegen_loader.g.dart';
import 'package:shamel_fibo/generated/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;

  setUpServiceLocator();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ar")],
      path: "assets/translations",
      fallbackLocale: Locale("en"),
      assetLoader: CodegenLoader(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getit<LogincubitCubit>()),
          BlocProvider(create: (context) => getit<RegisterCubit>()),
          BlocProvider(create: (context) => getit<HomeCubit>()),
          BlocProvider(create: (context) => getit<CartCubit>()),
          BlocProvider(create: (context) => getit<SearchCubit>()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          title: "Fibo_ecommerce",
          // theme: //mythemestl.whatever,
          routerConfig: RouterGeneration.goRouter,
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == "en") {
                context.setLocale(Locale("ar"));
              } else {
                context.setLocale(Locale("en"));
              }
            },
            icon: Icon(Icons.language),
          ),
          IconButton(
            onPressed: () {
              context.go(RouterGeneration.home);
              // context.pop();
              // context.push(RouterGeneration.home);
            },
            icon: Icon(Icons.arrow_back, color: Colors.amber),
          ),
        ],
      ),
      body: Center(child: Text(LocaleKeys.Auth_email.tr())),
    );
  }
}

class Sec extends StatelessWidget {
  const Sec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
