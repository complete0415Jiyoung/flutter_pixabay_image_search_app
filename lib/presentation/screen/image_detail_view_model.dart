import 'package:flutter/widgets.dart';
import 'package:flutter_pixabay_image_search_app/domain/repository/photo_repository.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/state/image_state.dart';

class ImageDetailViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;
  ImageDetailViewModel(this._photoRepository);

  ImageState _state = ImageState();
  ImageState get state => _state;

  Future<void> fetchImage(int id) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final photo = await _photoRepository.getImage(id);

      _state = _state.copyWith(photo: photo, isLoading: false);
    } catch (e) {
      _state = _state.copyWith(isLoading: false, errorMessage: e.toString());
    }

    notifyListeners();
  }
}
