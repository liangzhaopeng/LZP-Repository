// To parse this JSON data, do
//
//     final pageInfo = pageInfoFromJson(jsonString);

// PageInfo pageInfoFromString(String str) => PageInfo.fromJson(json.decode(str));

// PageInfo pageInfoFromJson(Map<String, dynamic> json) => PageInfo.fromJson(json);

// String pageInfoToJson(PageInfo data) => json.encode(data.toJson());

class PageInfo {
  PageInfo({
    required this.pageSize,
    required this.pageNumber,
    required this.total,
  });

  int pageSize;
  int pageNumber;
  int? total;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        pageSize: json["pageSize"],
        pageNumber:
            json.containsKey('pageNum') ? json["pageNum"] : json["pageNumber"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "total": total,
      };
}
