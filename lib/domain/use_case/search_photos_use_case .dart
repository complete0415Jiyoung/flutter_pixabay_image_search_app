import 'package:flutter_pixabay_image_search_app/core/result/result.dart';
import 'package:flutter_pixabay_image_search_app/domain/model/photo.dart';
import 'package:flutter_pixabay_image_search_app/domain/repository/photo_repository.dart';

class SearchPhotosUseCase {
  final PhotoRepository _photoRepository;

  SearchPhotosUseCase(this._photoRepository);

  Future<Result<List<Photo>, Exception>> execute(String query) async {
    try {
      final results = await _photoRepository.getImages(query);
      if (results.isEmpty) {
        return Result.error(Exception('"$query"\n검색결과가 없습니다.'));
      }
      return Result.success(results);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
