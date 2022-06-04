import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

import 'app_resources.dart';
import 'app_strings.dart';

class EmailService {
  static Future<bool> send({
    required String fromEmail,
    required String subject,
    required String content,
  }) async {
    final emailAPIUrl = Uri.parse(AppStrings.emailAPIUrl);
    final emailAPIKey = await rootBundle.loadString(AppResources.emailAPIKey);

    final response = await http.post(
      emailAPIUrl,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'api-key': emailAPIKey,
      },
      body: jsonEncode({
        'sender': {
          'email': fromEmail,
        },
        'to': [
          {
            'email': AppStrings.emailToMail,
            'name': AppStrings.emailToName,
          },
        ],
        'subject': subject,
        'htmlContent': content,
      }),
    );

    return response.statusCode >= 200 && response.statusCode <= 299;
  }
}
