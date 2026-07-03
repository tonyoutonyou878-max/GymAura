import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  const apiKey = 'sk-sbYtsQGXcNhE4M1tbmKozjau5axgyPHN2k5pIPsxll9Uuu3f'; 
  const baseUrl = 'https://api.stability.ai/v1/user/balance';

  print('Checking Stability AI Balance...');

  try {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('✅ Balance Check Successful!');
      print('Credits: ${data['credits']}');
    } else {
      print('❌ Balance Check Failed!');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
    }
  } catch (e) {
    print('❌ Exception: $e');
  }
}
