import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class BooksApi {
  static const String apiUrl = 'https://api.example.com/loved-books';

  Future<List<Book>> fetchLovedBooks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
