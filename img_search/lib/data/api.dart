import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Photo.dart';

class PixabayApi{
  Future<List<Photo>> fetch(String query) async {
    final baseUrl = 'https://pixabay.com/api/';
    final key = '35825880-38de1d0558f3290c6399e6e65';

    final response = await http.get(Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];

    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}


