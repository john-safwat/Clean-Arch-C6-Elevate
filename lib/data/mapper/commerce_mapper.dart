import 'package:c6_elevate_clean_arch/data/models/banners_response.dart';
import 'package:c6_elevate_clean_arch/data/models/categories_response.dart';
import 'package:c6_elevate_clean_arch/data/models/products_response.dart';
import 'package:c6_elevate_clean_arch/domain/entities/banner_entity.dart';
import 'package:c6_elevate_clean_arch/domain/entities/category_entity.dart';
import 'package:c6_elevate_clean_arch/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class CommerceMapper {
  List<ProductEntity> mapProductResponseListToProductEntityList(
    List<ProductResponse> products,
  ) {
    return products
        .map((product) => mapProductResponseToProductEntity(product))
        .toList();
  }

  ProductEntity mapProductResponseToProductEntity(ProductResponse product) {
    return ProductEntity(
      image: product.images ?? [],
      ratingsQuantity: product.ratingsQuantity?.toInt() ?? 0,
      id: product.id ?? "",
      title: product.title ?? "",
      slug: product.slug ?? "",
      description: product.description ?? "",
      quantity: product.quantity?.toInt() ?? 0,
      price: product.price ?? 0,
      imageCover: product.imageCover ?? "",
      ratingAverage: product.ratingsAverage?.toDouble() ?? 0.0,
    );
  }

  List<BannerEntity> mapBannersResponseListToBannersEntityList(
    List<BannerResponse> banners,
  ) {
    return banners
        .map((banner) => mapBannerResponseToBannerEntity(banner))
        .toList();
  }

  List<CategoryEntity> mapCategoryResponseListToCategoryEntityList(
    List<CategoryResponse> categories,
  ) {
    return categories
        .map(
          (category) => CategoryEntity(
            id: category.id ?? '',
            name: category.name ?? '',
            image: category.image ?? '',
          ),
        )
        .toList();
  }



  BannerEntity mapBannerResponseToBannerEntity(BannerResponse banner) {
    return BannerEntity(
      image: banner.image ?? "",
      title: banner.title ?? "",
      slogan: banner.categoryName ?? "",
      alignment: mapAlignment(banner.alignment ?? "START"),
      buttonBackGroundColor: Color((banner.buttonBackGroundColor ?? 0).toInt()),
      buttonForGroundColor: Color((banner.buttonForGroundColor ?? 0).toInt()),
    );
  }

  Alignment mapAlignment(String alignment) {
    return switch (alignment.toLowerCase()) {
      "start" => Alignment.bottomLeft,
      "end" => Alignment.bottomRight,
      _ => Alignment.center,
    };
  }
}
