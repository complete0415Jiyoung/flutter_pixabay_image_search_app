// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Image with _$Image {
  final int id;
  final String previewURL;
  final String largeImageURL;
  final String userName;
  final List<String> tags;

  const Image({
    required this.tags,
    required this.id,
    required this.previewURL,
    required this.largeImageURL,
    required this.userName,
  });
}
