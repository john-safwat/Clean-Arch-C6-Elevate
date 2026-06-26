class BannersResponse {
  BannersResponse({
      this.banners,});

  BannersResponse.fromJson(dynamic json) {
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(BannerResponse.fromJson(v));
      });
    }
  }
  List<BannerResponse>? banners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class BannerResponse {
  BannerResponse({
      this.image, 
      this.title, 
      this.categoryName, 
      this.alignment, 
      this.buttonBackGroundColor, 
      this.buttonForGroundColor,});

  BannerResponse.fromJson(dynamic json) {
    image = json['image'];
    title = json['title'];
    categoryName = json['categoryName'];
    alignment = json['alignment'];
    buttonBackGroundColor = json['buttonBackGroundColor'];
    buttonForGroundColor = json['buttonForGroundColor'];
  }
  String? image;
  String? title;
  String? categoryName;
  String? alignment;
  num? buttonBackGroundColor;
  num? buttonForGroundColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['title'] = title;
    map['categoryName'] = categoryName;
    map['alignment'] = alignment;
    map['buttonBackGroundColor'] = buttonBackGroundColor;
    map['buttonForGroundColor'] = buttonForGroundColor;
    return map;
  }

}