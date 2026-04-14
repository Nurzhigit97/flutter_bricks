import 'dart:convert';
import 'dart:developer';
import 'dart:io';

bool isEmailValid(String email) {
  // Regular expression pattern to validate email addresses
  const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';

  // Create a RegExp object with the pattern
  final regex = RegExp(pattern);

  // Use the RegExp object to match the email against the pattern
  return regex.hasMatch(email);
}

bool isPasswordValid(String password) {
  // Regular expression pattern to validate passwords
  const pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

  // Create a RegExp object with the pattern
  final regex = RegExp(pattern);

  // Use the RegExp object to match the password against the pattern
  return regex.hasMatch(password);
}

// validate for String cant be String need number

bool isPhoneNumberValid(String phoneNumber) {
  // Regular expression pattern to validate phone numbers
  const pattern = r'^\+996\d{9}$';

  final regex = RegExp(pattern);

  return regex.hasMatch(phoneNumber);
}

Future<String?> getBase64Image(File? image) async {
  if (image == null) return null;

  try {
    final bytes = await image.readAsBytes();
    return base64Encode(bytes);
  } catch (e) {
    log("Error converting image to base64: $e");
    return null;
  }
}
