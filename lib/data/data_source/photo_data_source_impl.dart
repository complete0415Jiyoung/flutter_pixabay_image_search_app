import 'dart:convert';

import 'package:flutter_pixabay_image_search_app/core/api/api_key.dart';
import 'package:flutter_pixabay_image_search_app/data/data_source/photo_data_source.dart';
import 'package:flutter_pixabay_image_search_app/data/dto/photo_dto.dart';
import 'package:flutter_pixabay_image_search_app/domain/model/pixabay.dart';
import 'package:http/http.dart' as http;

class PhotoDataSourceImpl implements PhotoDataSource {
  final String apiUrl = ApiKey.apiUrl;

  @override
  Future<List<PhotoDTO>> getImages(String qurey) async {
    final Pixabay pixabay = Pixabay(qurey: qurey);

    final response = await http.get(
      Uri.parse('$apiUrl${pixabay.toQuery(qurey)}'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> jsonList = jsonResponse['hits'];
      return jsonList.map((item) => PhotoDTO.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  Future<PhotoDTO> getImage(int id) async {
    final Pixabay pixabay = Pixabay(id: id);

    final response = await http.get(Uri.parse('$apiUrl${pixabay.toId(id)}'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> jsonList = jsonResponse['hits'];

      return jsonList.map((item) => PhotoDTO.fromJson(item)).toList().first;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
