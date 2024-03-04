import 'package:http/http.dart' as http;

class APIService {
  static Future<void> registerUser({
    required String email,
    required String password,
    required String birthDate,
    required String name,
    required String gender,
    required String height,
    required String weight,
    required String weightGoal,
    required String activityLevel,
  }) async {
    final Uri uri = Uri.parse('https://foodcal-app.up.railway.app/auth/register');
    final Map<String, String> body = {
      'email': email,
      'password': password,
      'birthDate': birthDate,
      'name': name,
      'gender': gender,
      'height': height,
      'weight': weight,
      'weightGoal': weightGoal,
      'activityLevel': activityLevel,
      'eatType': 'vegetarian',
      'userImg': 'https://example.com/user-image.jpg',
      'basalMetabolicRate': '1500',
      'totalDailyCalories': '2000',
    };

    try {
      final response = await http.post(
        uri,
        body: body,
      );

      if (response.statusCode == 200) {
        // Registration successful
        print('Registration successful');
        // You can navigate to another screen or perform any other action here
      } else {
        // Registration failed
        print('Registration failed: ${response.body}');
        // Handle the failure appropriately, display error message, etc.
      }
    } catch (error) {
      // Handle network errors
      print('Network error: $error');
    }
  }
}
