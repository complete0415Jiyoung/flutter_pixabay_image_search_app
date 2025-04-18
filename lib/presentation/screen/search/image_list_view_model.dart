import 'package:flutter/widgets.dart';
import 'package:flutter_pixabay_image_search_app/domain/repository/photo_repository.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/state/image_list_state.dart';

class ImageListViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;
  ImageListViewModel(this._photoRepository);

  ImageListState _state = ImageListState();
  ImageListState get state => _state;

  Future<void> fetchImages(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final images = await _photoRepository.getImages(query);
      _state = _state.copyWith(imageList: images, isLoading: false);
    } catch (e) {
      _state = _state.copyWith(isLoading: false, errorMessage: e.toString());
    }
    notifyListeners();
  }
}
