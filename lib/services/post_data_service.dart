import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class PostApiService {
  static Future<String> postData(String prompt) async {
    try {
      final response =
          await http.post(Uri.parse('https://api.openai.com/v1/completions'),
              headers: {
                'Content-Type': 'application/json',
                'Authorization':
                    'Bearer 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',
              },
              body: jsonEncode({
                "model": "gpt-3.5-turbo-instruct",
                "prompt": prompt,
                "max_tokens": 250,
                "temperature": 0,
              }));
      if (response.statusCode == 200) {
        log(response.body);
        return response.body;
      } else {
        log("Failed ${response.statusCode}");
        return "Failed: ${response.body}";
      }
    } catch (e) {
      return "Failed $e";
    }
  }
}
