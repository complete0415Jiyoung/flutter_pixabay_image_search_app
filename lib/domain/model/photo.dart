// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Photo with _$Photo {
  final int id;
  final String previewURL;
  final String largeImageURL;
  final double imageWidth;
  final double imageHeight;
  final String userName;
  final List<String> tags;

  const Photo({
    required this.tags,
    required this.id,
    required this.previewURL,
    required this.largeImageURL,
    required this.userName,
    required this.imageWidth,
    required this.imageHeight,
  });
}
