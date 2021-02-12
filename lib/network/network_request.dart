import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fake_flutter_api/model/photo.dart';
import 'package:flutter/foundation.dart';

List<Photo> parsePhotos(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
  return photos;
}

Future<List<Photo>> fetchPhotos() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/photos');
  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    throw Exception('Can\'t get photos');
  }
}
