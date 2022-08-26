class HomeBanner {
  int? id;
  String? bannerImageUrl;

  HomeBanner({this.id, this.bannerImageUrl});

  HomeBanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerImageUrl = json['bannerImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bannerImageUrl'] = bannerImageUrl;
    return data;
  }
}