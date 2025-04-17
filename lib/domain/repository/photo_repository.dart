import '../model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getImages(String query);
  Future<Photo> getImage(int id);
}
