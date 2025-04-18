// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/photo.dart';

part 'image_list_state.freezed.dart';

@freezed
class ImageListState with _$ImageListState {
  final List<Photo>? imageList;
  final bool isLoading;
  final String errorMessage;

  const ImageListState({
    this.imageList,
    this.isLoading = false,
    this.errorMessage = '',
  });
}
