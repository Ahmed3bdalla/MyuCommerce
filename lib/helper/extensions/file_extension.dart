import 'dart:convert';
import 'dart:io';

extension FileToBase64 on File {
  // Method to convert a File to a Base64 string
  Future<String> toBase64() async {
    final bytes = await readAsBytes();
    return base64Encode(bytes);
  }
}
