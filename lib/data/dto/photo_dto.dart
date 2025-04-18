class PhotoDTO {
  final int? photo;
  final String? previewURL;
  final String? largeImageURL;
  final double? previewWidth;
  final double? previewHeight;
  final String? user;
  final String? tags; // 태그는 CSV 형태로 올 수 있음

  PhotoDTO({
    this.photo,
    this.previewURL,
    this.largeImageURL,
    this.user,
    this.tags,
    this.previewWidth,
    this.previewHeight,
  });

  PhotoDTO.fromJson(Map<String, dynamic> json)
    : photo = json['id'],
      previewURL = json['previewURL'],
      largeImageURL = json['largeImageURL'],
      user = json['user'],
      tags = json['tags'] ?? '',
      previewWidth = json['previewWidth']?.toDouble(),
      previewHeight = json['previewHeight']?.toDouble();

  Map<String, dynamic> toJson() => {
    'id': photo,
    'previewURL': previewURL,
    'largeImageURL': largeImageURL,
    'user': user,
    'tags': tags,
    'previewWidth': previewWidth,
    'previewHeight': previewHeight,
  };
}
