class ImageDTO {
  final int? id;
  final String? previewURL;
  final String? largeImageURL;
  final String? user;
  final String? tags; // 태그는 CSV 형태로 올 수 있음

  // Named constructor
  ImageDTO({
    this.id,
    this.previewURL,
    this.largeImageURL,
    this.user,
    this.tags,
  });

  ImageDTO.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      previewURL = json['previewURL'],
      largeImageURL = json['largeImageURL'],
      user = json['user'],
      tags = json['tags'] ?? '';

  Map<String, dynamic> toJson() => {
    'id': id,
    'previewURL': previewURL,
    'largeImageURL': largeImageURL,
    'user': user,
    'tags': tags,
  };
}
