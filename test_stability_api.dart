import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  // Key from StabilityService.dart
  const apiKey = 'sk-sbYtsQGXcNhE4M1tbmKozjau5axgyPHN2k5pIPsxll9Uuu3f'; 
  const baseUrl = 'https://api.stability.ai/v1/generation';
  const engineId = 'stable-diffusion-xl-1024-v1-0';

  print('Testing Stability AI API...');

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/$engineId/text-to-image'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'text_prompts': [
          {
            'text': "A test image of a cat",
            'weight': 1,
          }
        ],
        'cfg_scale': 7,
        'height': 1024,
        'width': 1024,
        'samples': 1,
        'steps': 30,
      }),
    );

    if (response.statusCode == 200) {
      print('✅ API Call Successful!');
      final data = jsonDecode(response.body);
      print('Received ${data['artifacts'].length} artifacts.');
    } else {
      print('❌ API Call Failed!');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
    }
  } catch (e) {
    print('❌ Exception: $e');
  }
}
