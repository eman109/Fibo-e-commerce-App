import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shamel_fibo/core/routing/router_generation.dart';
import 'package:shamel_fibo/core/styling/app_colors.dart';
import 'package:shamel_fibo/core/widgets/customTextField.dart';
import 'package:shamel_fibo/core/widgets/primaryButton.dart';
import 'package:shamel_fibo/features/Auth/presentation/view_model/register_cubit/cubit/register_cubit.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 59.h),
            Image.asset("assets/Images/logo.png", width: 128.w, height: 49.h),
            SizedBox(height: 35.h),
            Text(
              "Create an account",
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.h),
            Text(
              "Let's create your account",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: 30.h),
            Customtextfield(
              Toplabel: "Full Name",
              hintText: "Enter your full name",
              label: "Enter your full name",
              controller: context.read<RegisterCubit>().username,
            ),
            SizedBox(height: 20.h),
            Customtextfield(
              Toplabel: "User Name",
              hintText: "Enter your email address",
              label: "Enter your email address",
              controller: context.read<RegisterCubit>().email,
            ),
            SizedBox(height: 20.h),
            Customtextfield(
              ispassword: true,
              Toplabel: "Password",
              hintText: "Enter your password",
              label: "Enter your password",
              controller: context.read<RegisterCubit>().password,
            ),
            SizedBox(height: 20.h),
            Customtextfield(
              ispassword: true,
              Toplabel: "Confirm Password",
              label: "Enter your password",
              hintText: "Enter your password",
              controller: context.read<RegisterCubit>().confirmpass,
            ),
            SizedBox(height: 40.h),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  context.go(RouterGeneration.home);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Welcome!! ${state.user.username}")),
                  );
                }
                if (state is RegisterError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },

              builder: (context, state) {
                if (state is RegisterLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return Primarybutton(
                  backgroundColor: AppColors.buttonColor,
                  onpress: () {
                    if (context.read<RegisterCubit>().password ==
                        context.read<RegisterCubit>().confirmpass) {
                      context.read<RegisterCubit>().register();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("rewrite password")),
                      );
                      context.read<RegisterCubit>().clearpasswords();
                    }
                  },
                  fontsize: 17.sp,
                  fontweight: FontWeight.w700,
                  buttonText: "REGISTER",
                  width: 325.w,
                  height: 66.h,
                  color: AppColors.whiteColor,
                );
              },
            ),

            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ALready have an account? ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                InkWell(
                  onTap: () {
                    context.read<RegisterCubit>().clearpasswords();
                    context.read<RegisterCubit>().clearcontrollers();
                    context.go(RouterGeneration.login);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
