import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class GetApiService {
  static Future<void> getData() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.openai.com/v1/models'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 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',
        },
      );
      Map jsonResponse = jsonDecode(response.body);

      log(response.body);
      log("response is $jsonResponse");
    } catch (e) {
      log('error is $e');
    }
  }
}
