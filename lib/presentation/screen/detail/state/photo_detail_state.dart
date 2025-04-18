// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/photo.dart';

part 'photo_detail_state.freezed.dart';

@freezed
class PhotoDetailState with _$PhotoDetailState {
  final Photo? photo;
  final bool isLoading;
  final String errorMessage;

  const PhotoDetailState({
    this.photo,
    this.isLoading = false,
    this.errorMessage = '',
  });
}
