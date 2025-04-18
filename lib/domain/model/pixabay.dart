import 'package:flutter_pixabay_image_search_app/core/api/api_key.dart';

class Pixabay {
  final String key;
  final String lang;
  final String imageType;
  final String? qurey;
  final int? id;

  Pixabay({
    String? key,
    this.lang = 'ko',
    this.imageType = 'photo',
    this.qurey,
    this.id,
  }) : key = key ?? ApiKey.pixabayKey;

  String toQuery(String qurey) {
    return '?key=$key&lang=$lang&image_type=$imageType&q=$qurey';
  }

  String toId(int id) {
    return '?key=$key&lang=$lang&image_type=$imageType&id=$id';
  }
}
