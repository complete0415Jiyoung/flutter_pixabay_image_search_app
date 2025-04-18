import 'package:flutter_pixabay_image_search_app/data/dto/photo_dto.dart';
import 'package:flutter_pixabay_image_search_app/domain/model/photo.dart';

extension PhotoMapper on PhotoDTO {
  Photo toImage() {
    return Photo(
      id: photo ?? -1,
      previewURL: previewURL ?? '',
      largeImageURL: largeImageURL ?? '',
      userName: user ?? '',
      tags: _parseTags(tags),
      imageWidth: previewWidth?.toDouble() ?? 0.0,
      imageHeight: previewHeight?.toDouble() ?? 0.0,
    );
  }

  List<String> _parseTags(String? tags) {
    if (tags == null || tags.isEmpty) {
      return [];
    }
    return tags.split(',').map((tag) => tag.trim()).toList();
  }
}
