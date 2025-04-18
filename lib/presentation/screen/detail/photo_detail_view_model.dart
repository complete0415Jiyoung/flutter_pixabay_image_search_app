import 'package:flutter/widgets.dart';
import 'package:flutter_pixabay_image_search_app/core/result/result.dart';
import 'package:flutter_pixabay_image_search_app/domain/model/photo.dart';
import 'package:flutter_pixabay_image_search_app/domain/use_case/search_photo_by_id_use_case.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/detail/state/photo_detail_state.dart';

class PhotoDetailViewModel with ChangeNotifier {
  final SearchPhotoByIdUseCase _searchPhotoByIdUseCase;
  PhotoDetailViewModel(this._searchPhotoByIdUseCase);

  PhotoDetailState _state = PhotoDetailState();
  PhotoDetailState get state => _state;

  Future<void> fetchImage(int id) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    // try {
    //   final photo = await _photoRepository.getImage(id);

    //   _state = _state.copyWith(photo: photo, isLoading: false);
    // } catch (e) {
    //   _state = _state.copyWith(isLoading: false, errorMessage: e.toString());
    // }
    final result = await _searchPhotoByIdUseCase.execute(id);
    if (result is Success<List<Photo>, Exception>) {
      _state = _state.copyWith(photo: result.data.first, isLoading: false);
    } else if (result is Error<List<Photo>, Exception>) {
      _state = _state.copyWith(
        isLoading: false,

        errorMessage: result.error.toString().replaceAll('Exception: ', ''),
      );
    }

    notifyListeners();
  }
}
