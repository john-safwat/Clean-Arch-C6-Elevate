class CategoriesResponse {
  CategoriesResponse({
      this.results, 
      this.metadata, 
      this.data,});

  CategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryResponse.fromJson(v));
      });
    }
  }
  num? results;
  Metadata? metadata;
  List<CategoryResponse>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CategoryResponse {
  CategoryResponse({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  CategoryResponse.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  num? currentPage;
  num? numberOfPages;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

}