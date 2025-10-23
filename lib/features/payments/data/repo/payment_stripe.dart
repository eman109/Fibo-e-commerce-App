import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shamel_fibo/core/network/apiConsumer.dart';
import 'package:shamel_fibo/core/network/failures.dart';
import 'package:shamel_fibo/features/payments/data/model/pay_intent_model.dart';
import 'package:shamel_fibo/features/payments/data/repo/pay_repo.dart';

class PaymentStripeImpl implements PayRepo {
  Apiconsumer apiconsumer;
  PaymentStripeImpl(this.apiconsumer);
  @override
  Future makePayment(int amount, String currency) async {
    final result = await _createPaymentendpoint(amount, currency);
    result.fold(
      (l) => null,
      (r) async => await _initPaymentSheet(r.clientSecret)
    );
    await Stripe.instance.presentPaymentSheet();
  }

  Future<Either<Failures, PayIntentModel>> _createPaymentendpoint(
    int amount,
    String currency,
  ) async {
    try {
      final data = await apiconsumer.post(
        "https://api.stripe.com/v1/payment_intents",
        {"amount": amount, "currency": currency},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization":
                "Bearer ${dotenv.env['STRIPE_SECRET_KEY']!}",
          },
        ),
      );
      return Future.value(right(PayIntentModel.fromJson(data)));
    } catch (e) {
      if (e is DioException) {
        return Future.value(left(Serverfailure.fromDioException(e)));
      }
      return Future.value(left(Serverfailure(e.toString())));
    }
  }

  Future<void> _initPaymentSheet(String clientSecret) async {

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(

        customFlow: false,
        merchantDisplayName: 'Fibo',
        paymentIntentClientSecret: clientSecret,
        style: ThemeMode.dark,
      ),
    );
  }
}
