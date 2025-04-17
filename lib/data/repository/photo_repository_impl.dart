import 'package:flutter_pixabay_image_search_app/data/data_source/photo_data_source.dart';
import 'package:flutter_pixabay_image_search_app/data/mepper/photo_mapper.dart';
import 'package:flutter_pixabay_image_search_app/domain/repository/photo_repository.dart';

import '../../domain/model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _imageDataSource;
  PhotoRepositoryImpl(this._imageDataSource);
  @override
  Future<List<Photo>> getImages(String query) async {
    final photoDTOs = await _imageDataSource.getImages(query);
    return photoDTOs.map((dto) => dto.toImage()).toList();
  }

  @override
  Future<Photo> getImage(int id) async {
    final photoDTO = await _imageDataSource.getImage(id);
    return photoDTO.toImage();
  }
}
