import 'package:flutter_pixabay_image_search_app/core/result/result.dart';
import 'package:flutter_pixabay_image_search_app/domain/model/photo.dart';
import 'package:flutter_pixabay_image_search_app/domain/repository/photo_repository.dart';

class SearchPhotoByIdUseCase {
  final PhotoRepository _photoRepository;

  SearchPhotoByIdUseCase(this._photoRepository);

  Future<Result<List<Photo>, Exception>> execute(int id) async {
    try {
      final results = await _photoRepository.getImage(id);
      return Result.success([results]);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
