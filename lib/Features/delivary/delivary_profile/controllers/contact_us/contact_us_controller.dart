import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class DelivaryContactUsController extends GetxController {
  openWhatsAppChat({required String phoneNumber, String message = ''});
  openCallApp(String phoneNumber);
  openFacebookProfile(String profileIdOrUsername);
  openFacebookPage(String pageIdOrUsername);
  sendNewEmail({String? toEmail, String? subject, String? body});
  encodeQueryParameters(Map<String, String> params);
}

class DelivaryContactUsControllerImp extends DelivaryContactUsController {
  @override
  Future<void> openWhatsAppChat(
      {required String phoneNumber, String message = ''}) async {
    var whatsappUrl =
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Future<void> openCallApp(String phoneNumber) async {
    var phoneUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }

  @override
  Future<void> openFacebookProfile(String profileIdOrUsername) async {
    // Try opening in the app
    var appUrl = 'fb://profile/$profileIdOrUsername';
    if (await canLaunch(appUrl)) {
      await launch(appUrl);
    } else {
      // Fallback to opening in a web browser
      var webUrl = 'https://facebook.com/$profileIdOrUsername';
      if (await canLaunch(webUrl)) {
        await launch(webUrl);
      } else {
        throw 'Could not launch Facebook profile';
      }
    }
  }

  @override
  Future<void> openFacebookPage(String pageIdOrUsername) async {
    var appUrl =
        'fb://page/$pageIdOrUsername'; // For opening in the Facebook app
    var webUrl =
        'https://facebook.com/$pageIdOrUsername'; // Fallback to the web browser

    if (await canLaunch(appUrl)) {
      await launch(appUrl);
    } else if (await canLaunch(webUrl)) {
      await launch(webUrl);
    } else {
      throw 'Could not launch Facebook page';
    }
  }

  @override
  Future<void> sendNewEmail({
    String? toEmail,
    String? subject,
    String? body,
  }) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query: encodeQueryParameters(<String, String>{
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      }),
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch email client';
    }
  }

  @override
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
