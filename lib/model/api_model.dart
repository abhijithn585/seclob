class ApiModel {
  int? likeCount;
  int? commentCount;
  String? profilePic;
  String? firstName;
  String? lastName;
  String? filePath;
  ApiModel({
    required this.likeCount,
    required this.commentCount,
    required this.profilePic,
    required this.firstName,
    required this.lastName,
    required this.filePath,
  });
  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      profilePic: json['profilePic'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      filePath: json['filePath'],
    );
  }
}
