class ApiModel {
  int? likeCount;
  int? commentCount;
  String? profilePic;
  String? firstName;
  ApiModel({
    required this.likeCount,
    required this.commentCount,
    required this.profilePic,
    required this.firstName,
  });
  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
        likeCount: json['likeCount'],
        commentCount: json['commentCount'],
        profilePic: json['profilePic'],
        firstName: json['firstName']);
  }
}
