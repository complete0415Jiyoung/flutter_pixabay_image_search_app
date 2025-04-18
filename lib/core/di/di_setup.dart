import 'package:flutter_pixabay_image_search_app/data/data_source/photo_data_source.dart';
import 'package:flutter_pixabay_image_search_app/data/data_source/photo_data_source_impl.dart';
import 'package:flutter_pixabay_image_search_app/data/repository/photo_repository_impl.dart';
import 'package:flutter_pixabay_image_search_app/domain/repository/photo_repository.dart';
import 'package:flutter_pixabay_image_search_app/domain/use_case/search_photo_by_id_use_case.dart';
import 'package:flutter_pixabay_image_search_app/domain/use_case/search_photos_use_case%20.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/detail/photo_detail_view_model.dart';
import 'package:flutter_pixabay_image_search_app/presentation/screen/search/photo_search_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<PhotoDataSource>(PhotoDataSourceImpl());
  getIt.registerSingleton<PhotoRepository>(
    PhotoRepositoryImpl(getIt<PhotoDataSource>()),
  );
  getIt.registerSingleton<SearchPhotosUseCase>(
    SearchPhotosUseCase(getIt<PhotoRepository>()),
  );
  getIt.registerSingleton<SearchPhotoByIdUseCase>(
    SearchPhotoByIdUseCase(getIt<PhotoRepository>()),
  );
  getIt.registerFactory(
    () => PhotoSearchViewModel(getIt<SearchPhotosUseCase>()),
  );
  getIt.registerFactory(
    () => PhotoDetailViewModel(getIt<SearchPhotoByIdUseCase>()),
  );
}
