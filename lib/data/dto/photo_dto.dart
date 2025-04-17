class PhotoDTO {
  final int? photo;
  final String? previewURL;
  final String? largeImageURL;
  final String? user;
  final String? tags; // 태그는 CSV 형태로 올 수 있음

  PhotoDTO({
    this.photo,
    this.previewURL,
    this.largeImageURL,
    this.user,
    this.tags,
  });

  PhotoDTO.fromJson(Map<String, dynamic> json)
    : photo = json['id'],
      previewURL = json['previewURL'],
      largeImageURL = json['largeImageURL'],
      user = json['user'],
      tags = json['tags'] ?? '';

  Map<String, dynamic> toJson() => {
    'id': photo,
    'previewURL': previewURL,
    'largeImageURL': largeImageURL,
    'user': user,
    'tags': tags,
  };
}
