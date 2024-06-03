import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/utils.dart';

class PaymobManger {
  final Dio _dio = Dio();

  ///////// new api method ////////
  Future<String> _createIntention({
    required int amount,
    required String currency,
    required String userFirstName,
    required String userLastName,
    required String userPhoneNumber,
  }) async {
    const String url = 'https://accept.paymob.com/v1/intention/';
    final Map<String, dynamic> data = {
      'amount': (100 * amount),
      'currency': currency,
      'payment_methods': [
        int.parse(Utils.paymobCardPaymentMethodIntegrationId),
        int.parse(Utils.paymobMobileWalletPaymentMethodIntegrationId),
      ],
      'items': [],
      'billing_data': {
        "first_name": userFirstName,
        "last_name": userLastName,
        "phone_number": userPhoneNumber,
      },
    };

    try {
      final response = await _dio.post(
        url,
        options: Options(
          headers: {
            'Authorization': 'Token ${Utils.payMobTestSecretKey}',
            'Content-Type': 'application/json',
          },
        ),
        data: data,
      );

      if (response.statusCode == 201) {
        return response.data["client_secret"];
      } else {
        throw Exception(
            'Failed to create intention: ${response.statusMessage}');
      }
    } on DioError catch (dioError) {
      // Handle Dio-specific errors
      if (dioError.response != null) {
        print('Dio error: ${dioError.response?.data}');
        throw Exception(
            'Failed to create intention: ${dioError.response?.data}');
      } else {
        print('Dio error: $dioError');
        throw Exception('Failed to create intention: $dioError');
      }
    } catch (e) {
      // Handle other types of errors
      print('Unexpected error: $e');
      throw Exception('Failed to create intention: $e');
    }
  }

  Future<void> pay({
    required int amount,
    required String currency,
    required String userFirstName,
    required String userLastName,
    required String userPhoneNumber,
  }) async {
    try {
      final clientSecret = await _createIntention(
        amount: amount,
        currency: currency,
        userFirstName: userFirstName,
        userLastName: userLastName,
        userPhoneNumber: userPhoneNumber,
      );

      final url =
          "https://accept.paymob.com/unifiedcheckout/?publicKey=${Utils.payMobTestPublicKey}&clientSecret=$clientSecret";

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error during payment: $e');
    }
  }

  ////////////////////////// END //////////////////////////

  // Future<String> getPaymentKey(int amount, String currency) async {
  //   try {
  //     String authanticationToken = await _getAuthenticationToken();
  //     int orderId = await _getOrderId(
  //       authanticationToken: authanticationToken,
  //       amount: (100 * amount).toString(),
  //       currency: currency,
  //     );
  //     String paymentKey = await _getPayMentKey(
  //       authanticationToken: authanticationToken,
  //       amount: (100 * amount).toString(),
  //       orderId: orderId.toString(),
  //       currency: currency,
  //     );
  //     return paymentKey;
  //   } catch (e) {
  //     print("==========================================");
  //     print(e.toString());
  //     throw Exception();
  //   }
  // }

  // Future<String> _getAuthenticationToken() async {
  //   final Response response =
  //       await Dio().post("https://accept.paymob.com/api/auth/tokens", data: {
  //     "api_key": Utils.payMobApiKey,
  //   });
  //   return response.data["token"];
  // }

  // Future<int> _getOrderId(
  //     {required String authanticationToken,
  //     required String amount,
  //     required String currency}) async {
  //   final Response response = await Dio()
  //       .post("https://accept.paymob.com/api/ecommerce/orders", data: {
  //     "auth_token": authanticationToken,
  //     "amount_cents": amount, // (STRING)
  //     "currency": currency, // Not Rec
  //     "delivery_needed": "false",
  //     "items": [],
  //   });
  //   return response.data["id"]; // INTGER
  // }

  // Future<String> _getPayMentKey({
  //   required String authanticationToken,
  //   required String orderId,
  //   required String amount,
  //   required String currency,
  // }) async {
  //   final Response response = await Dio().post(
  //     "https://accept.paymob.com/api/acceptance/payment_keys",
  //     data: {
  //       // ALL OF RHEM ARE REQIRED
  //       "expiration": 3600,
  //       "auth_token": authanticationToken, // FROM FIRST API
  //       "order_id": orderId, // FROM SECOUND API (STRING)
  //       "integration_id": Utils
  //           .paymobMobileWalletPaymentMethodIntegrationId, // Integration Id od the Payment Method
  //       // paymobCardPaymentMethodIntegrationId
  //       "currency": currency,
  //       "amount_cents": amount,
  //       "billing_data": {
  //         // HAVE TO BE VALUES
  //         "first_name": "Clifford",
  //         "last_name": "Nicolas",
  //         "email": "claudette09@exa.com",
  //         "phone_number": "+86(8)9135210487",

  //         // CAN SET "NA"
  //         "apartment": "NA",
  //         "floor": "NA",
  //         "street": "NA",
  //         "building": "NA",

  //         "shipping_method": "NA",
  //         "postal_code": "NA",
  //         "city": "NA",
  //         "country": "NA",
  //         "state": "NA"
  //       },
  //     },
  //   );
  //   return response.data["token"];
  // }

  // ////////// test wallet

  // Future<String> testgetPaymentWalletKey(int amount, String currency) async {
  //   try {
  //     String authanticationToken = await _getAuthenticationToken();
  //     int orderId = await _getOrderId(
  //       authanticationToken: authanticationToken,
  //       amount: (100 * amount).toString(),
  //       currency: currency,
  //     );

  //     String paymentKey = await _getPayMentKey(
  //       authanticationToken: authanticationToken,
  //       amount: (100 * amount).toString(),
  //       orderId: orderId.toString(),
  //       currency: currency,
  //     );

  //     String finalToken = await _testgetPayMentWalletKey(
  //         authanticationToken: paymentKey, mobileNumber: "01010101010");
  //     return finalToken;
  //   } catch (e) {
  //     print("==========================================");
  //     print(e.toString());
  //     throw Exception();
  //   }
  // }

  // Future<String> _testgetPayMentWalletKey({
  //   required String authanticationToken,
  //   required String mobileNumber,
  // }) async {
  //   final Response response = await Dio().post(
  //     "https://accept.paymob.com/api/acceptance/payments/pay",
  //     data: {
  //       "source": {"identifier": mobileNumber, "subtype": "WALLET"},
  //       "payment_token": authanticationToken, // token obtained in step 3
  //     },
  //   );
  //   return response.data["redirect_url"];
  // }
}
