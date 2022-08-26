import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  Comment({
    this.accountId,
    this.accountName,
    required this.childComment,
    required this.content,
    required this.createdAt,
    this.headImage,
    this.hided,
    this.id,
    this.myself,
    required this.nickName,
    this.parentAccountId,
    this.parentId,
    this.parentNickName,
    required this.recordId,
    this.replyCount,
    this.target,
    this.theme,
    this.topCommentId,
  });

  dynamic accountId;
  String? accountName;
  List<Comment> childComment;
  String content = "";
  String createdAt;
  String? headImage = "";
  bool? hided = false;
  int? id = 0;
  bool? myself = false;
  String nickName;
  dynamic parentAccountId;
  int? parentId;
  String? parentNickName;
  int recordId = 0;
  int? replyCount = 1;
  String? target;
  String? theme;
  int? topCommentId;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        accountId: json["accountId"],
        accountName: json["accountName"],
        childComment: json["childComment"] = List<Comment>.from(
            json["childComment"].map((x) => Comment.fromJson(x))),
        content: json["content"],
        createdAt: json["createdAt"],
        headImage: json["headImage"],
        hided: json["hided"],
        id: json["id"],
        myself: json["myself"],
        nickName: json["nickName"],
        parentAccountId: json["parentAccountId"],
        parentId: json["parentId"],
        parentNickName: json["parentNickName"],
        recordId: json["recordId"],
        replyCount: json["replyCount"],
        target: json["target"],
        theme: json["theme"],
        topCommentId: json["topCommentId"],
      );

  Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "accountName": accountName,
        "childComment": childComment == null
            ? null
            : List<dynamic>.from(childComment.map((x) => x.toJson())),
        "content": content,
        "createdAt": createdAt,
        "headImage": headImage,
        "hided": hided,
        "id": id,
        "myself": myself,
        "nickName": nickName,
        "parentAccountId": parentAccountId,
        "parentId": parentId,
        "parentNickName": parentNickName,
        "recordId": recordId,
        "replyCount": replyCount,
        "target": target,
        "theme": theme,
        "topCommentId": topCommentId,
      };
}
