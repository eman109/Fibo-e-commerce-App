import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shamel_fibo/core/routing/router_generation.dart';
import 'package:shamel_fibo/core/styling/app_colors.dart';
import 'package:shamel_fibo/core/widgets/customTextField.dart';
import 'package:shamel_fibo/core/widgets/primaryButton.dart';
import 'package:shamel_fibo/features/Auth/presentation/view_model/login_cubit/logincubit_cubit.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 112.h),
          Image.asset("assets/Images/logo.png"),
          Text(
            "Login account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(
            "It’s great to see you again.",
            style: TextStyle(fontSize: 16, color: AppColors.greyColor),
          ),

          SizedBox(height: 100.h),
          Customtextfield(
            Toplabel: "Username",
            label: "Enter your username",
            hintText: "Enter your username",
            controller: context.read<LogincubitCubit>().username,
          ),
          SizedBox(height: 17.h),
          Customtextfield(
            ispassword: true,

            Toplabel: "Password",
            label: " Enter your password",
            hintText: "Enter your password",
            controller: context.read<LogincubitCubit>().password,
          ),
          SizedBox(height: 70.h),

          BlocConsumer<LogincubitCubit, LogincubitState>(
            listener: (context, state) {
              if (state is LogincubitSuccess) {
                context.go(RouterGeneration.home);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Welcome to the app ${state.user.username}"),
                  ),
                );
              }
              if (state is LogincubitError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is LogincubitLoading) {
                return Center(child: CircularProgressIndicator());
              }

              return Primarybutton(
                backgroundColor: AppColors.buttonColor,
                onpress: () {
                  context.read<LogincubitCubit>().login();
                },
                width: 325.w,
                height: 66.h,
                buttonText: "LOGIN",
                fontsize: 14.sp,
                fontweight: FontWeight.w700,
                color: AppColors.whiteColor,

                );
            },
          ),
          SizedBox(height: 110.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account yet?",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              InkWell(
                onTap: () => context.go(RouterGeneration.register),
                child: Text(
                  " Register",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
