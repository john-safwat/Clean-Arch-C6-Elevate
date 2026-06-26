
import 'package:c6_elevate_clean_arch/core/network/api_results.dart';
import 'package:c6_elevate_clean_arch/domain/entities/banner_entity.dart';
import 'package:c6_elevate_clean_arch/domain/entities/category_entity.dart';
import 'package:c6_elevate_clean_arch/domain/entities/product_entity.dart';

abstract class HomeRepo{
  Future<ApiResults<List<BannerEntity>>> getBanners();
  Future<ApiResults<List<ProductEntity>>> getProductsByCategory(String categoryId);
  Future<ApiResults<List<CategoryEntity>>> getCategories();
}