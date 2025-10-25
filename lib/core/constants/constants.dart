import 'package:url_launcher/url_launcher.dart';

bool isLoggedUser = false;

class Constants {
  static const String USER_KEY = 'USERKEY';

  static Future<void> openTelegramBot() async {
    final Uri telegramUrl = Uri.parse('tg://resolve?domain=aqar3_bot');
    if (!await launchUrl(telegramUrl, mode: LaunchMode.externalApplication)) {
      final Uri webUrl = Uri.parse('https://t.me/aqar3_bot?start=welcome');
      await launchUrl(webUrl, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> makePhoneCall() async {
    final Uri url = Uri(scheme: 'tel', path: '+20 1095856941');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> sendEmail() async {
    final Uri gmailUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm&fs=1'
      '&to=karimslama917@gmail.com'
      '&su=Hello%20Karim'
      '&body=I%20want%20to%20contact%20you',
    );

    if (await canLaunchUrl(gmailUri)) {
      await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open Gmail';
    }
  }
}
