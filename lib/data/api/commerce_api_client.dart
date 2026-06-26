import 'package:c6_elevate_clean_arch/data/models/categories_response.dart';
import 'package:c6_elevate_clean_arch/data/models/products_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/network/api_constants.dart' show baseUrl;

part 'commerce_api_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class CommerceApiClient {
  factory CommerceApiClient(Dio dio) = _CommerceApiClient;

  @GET("/api/v1/categories")
  Future<CategoriesResponse> getCategories();

  @GET("/api/v1/products")
  Future<ProductsResponse> getProducts(@Query("category") String categoryId);
}
