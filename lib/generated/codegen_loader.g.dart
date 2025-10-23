// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "Auth": {
    "email": "البريد الالكتروني",
    "password": "كلمة المرور",
    "login": "تسجيل الدخول",
    "register": "تسجيل حساب جديد",
    "or": "أو"
  },
  "Home": {
    "title": "الصفحة الرئيسية",
    "profile": "الصفحة الشخصية",
    "logout": "تسجيل الخروج"
  }
};
static const Map<String,dynamic> _en = {
  "Auth": {
    "email": "Email",
    "password": "Password",
    "login": "Login",
    "register": "Register",
    "or": "Or"
  },
  "Home": {
    "title": "Title",
    "profile": "Profile",
    "logout": "Logout"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
