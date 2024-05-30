import 'package:dio/dio.dart';

import '../utils/utils.dart';

class PaymobManger {
  Future<String> getPaymentKey(int amount, String currency) async {
    try {
      String authanticationToken = await _getAuthenticationToken();
      int orderId = await _getOrderId(
        authanticationToken: authanticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );
      String paymentKey = await _getPayMentKey(
        authanticationToken: authanticationToken,
        amount: (100 * amount).toString(),
        orderId: orderId.toString(),
        currency: currency,
      );
      return paymentKey;
    } catch (e) {
      print("==========================================");
      print(e.toString());
      throw Exception();
    }
  }

  Future<String> _getAuthenticationToken() async {
    final Response response =
        await Dio().post("https://accept.paymob.com/api/auth/tokens", data: {
      "api_key": Utils.payMobApiKey,
    });
    return response.data["token"];
  }

  Future<int> _getOrderId(
      {required String authanticationToken,
      required String amount,
      required String currency}) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/ecommerce/orders", data: {
      "auth_token": authanticationToken,
      "amount_cents": amount, // (STRING)
      "currency": currency, // Not Rec
      "delivery_needed": "false",
      "items": [],
    });
    return response.data["id"]; // INTGER
  }

  Future<String> _getPayMentKey({
    required String authanticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/acceptance/payment_keys",
      data: {
        // ALL OF RHEM ARE REQIRED
        "expiration": 3600,
        "auth_token": authanticationToken, // FROM FIRST API
        "order_id": orderId, // FROM SECOUND API (STRING)
        "integration_id": Utils
            .paymobMobileWalletPaymentMethodIntegrationId, // Integration Id od the Payment Method
        // paymobCardPaymentMethodIntegrationId
        "currency": currency,
        "amount_cents": amount,
        "billing_data": {
          // HAVE TO BE VALUES
          "first_name": "Clifford",
          "last_name": "Nicolas",
          "email": "claudette09@exa.com",
          "phone_number": "+86(8)9135210487",

          // CAN SET "NA"
          "apartment": "NA",
          "floor": "NA",
          "street": "NA",
          "building": "NA",

          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "state": "NA"
        },
      },
    );
    return response.data["token"];
  }

  ////////// test wallet

  Future<String> testgetPaymentWalletKey(int amount, String currency) async {
    try {
      String authanticationToken = await _getAuthenticationToken();
      int orderId = await _getOrderId(
        authanticationToken: authanticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );

      String paymentKey = await _getPayMentKey(
        authanticationToken: authanticationToken,
        amount: (100 * amount).toString(),
        orderId: orderId.toString(),
        currency: currency,
      );

      String finalToken = await _testgetPayMentWalletKey(
          authanticationToken: paymentKey, mobileNumber: "01010101010");
      return finalToken;
    } catch (e) {
      print("==========================================");
      print(e.toString());
      throw Exception();
    }
  }

  Future<String> _testgetPayMentWalletKey({
    required String authanticationToken,
    required String mobileNumber,
  }) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/acceptance/payments/pay",
      data: {
        "source": {"identifier": mobileNumber, "subtype": "WALLET"},
        "payment_token": authanticationToken, // token obtained in step 3
      },
    );
    return response.data["redirect_url"];
  }
}
