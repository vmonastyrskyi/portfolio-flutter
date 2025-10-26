import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http/http.dart' as http;

import 'app_strings.dart';

class EmailService {
  static Future<bool> send({
    required String fromEmail,
    required String subject,
    required String content,
  }) async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    final emailAPIUrl = Uri.parse('${AppStrings.emailAPIUrl}/smtp/email');
    final emailAPIKey = remoteConfig.getString('email_api_key');

    final response = await http.post(
      emailAPIUrl,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'api-key': emailAPIKey,
      },
      body: jsonEncode({
        'sender': {'email': fromEmail},
        'to': [
          {'email': AppStrings.emailToMail, 'name': AppStrings.emailToName},
        ],
        'htmlContent': content,
        'subject': subject,
      }),
    );

    return response.statusCode >= 200 && response.statusCode <= 299;
  }
}
