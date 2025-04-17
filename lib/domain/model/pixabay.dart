import 'package:flutter_pixabay_image_search_app/core/api_key.dart';

class Pixabay {
  final String key;
  final String lang;
  final String imageType;
  final String qurey;

  Pixabay({
    String? key,
    this.lang = 'ko',
    this.imageType = 'photo',
    required this.qurey,
  }) : key = key ?? ApiKey.pixabayKey;

  String toQuery() {
    return '?key=$key&lang=$lang&image_type=$imageType&q=$qurey}';
  }
}
