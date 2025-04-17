import 'package:flutter_pixabay_image_search_app/data/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDTO>> getImages(String query);
  Future<PhotoDTO> getImage(int id);
}
