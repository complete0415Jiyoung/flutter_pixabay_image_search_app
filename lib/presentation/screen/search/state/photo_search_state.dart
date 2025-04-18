// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/photo.dart';

part 'photo_search_state.freezed.dart';

@freezed
class PhotoSearchState with _$PhotoSearchState {
  final List<Photo> imageList;
  final bool isLoading;
  final String errorMessage;
  final String currentKeyword;

  const PhotoSearchState({
    this.imageList = const [],
    this.isLoading = false,
    this.errorMessage = '',
    this.currentKeyword = '',
  });
}
