class ApiModel {
  int? likeCount;
  int? commentCount;
  String? profilePic;
  String? firstName;
  String? filePath;
  ApiModel({
    required this.likeCount,
    required this.commentCount,
    required this.profilePic,
    required this.firstName,
    required this.filePath,
  });
  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      profilePic: json['profilePic'],
      firstName: json['firstName'],
      filePath: json['filePath'],
    );
  }
}
