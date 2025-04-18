// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/photo.dart';

part 'image_state.freezed.dart';

@freezed
class ImageState with _$ImageState {
  final Photo? photo;
  final bool isLoading;
  final String errorMessage;

  const ImageState({
    this.photo,
    this.isLoading = false,
    this.errorMessage = '',
  });
}
