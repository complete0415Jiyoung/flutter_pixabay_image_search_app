import 'package:flutter/widgets.dart';
import 'package:flutter_pixabay_image_search_app/core/result/result.dart';
import 'package:flutter_pixabay_image_search_app/domain/model/photo.dart';

import 'package:flutter_pixabay_image_search_app/domain/use_case/search_photos_use_case%20.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/search/state/photo_search_state.dart';

class PhotoSearchViewModel with ChangeNotifier {
  final SearchPhotosUseCase _searchPhotosUseCase;
  PhotoSearchViewModel(this._searchPhotosUseCase);

  PhotoSearchState _state = PhotoSearchState();
  PhotoSearchState get state => _state;

  Future<void> fetchImages(String query) async {
    _state = _state.copyWith(isLoading: true, errorMessage: '');
    notifyListeners();

    final result = await _searchPhotosUseCase.execute(query);

    if (result is Success<List<Photo>, Exception>) {
      _state = _state.copyWith(imageList: result.data, isLoading: false);
    } else if (result is Error<List<Photo>, Exception>) {
      _state = _state.copyWith(
        isLoading: false,
        imageList: [],
        errorMessage: result.error.toString().replaceAll('Exception: ', ''),
      );
    }
    notifyListeners();
  }
}
