import 'package:c6_elevate_clean_arch/core/network/api_results.dart';
import 'package:c6_elevate_clean_arch/core/network/safe_call.dart';
import 'package:c6_elevate_clean_arch/data/api/commerce_api_client.dart';
import 'package:c6_elevate_clean_arch/data/datasource/contract/commerce_local_datasource.dart';
import 'package:c6_elevate_clean_arch/data/mapper/commerce_mapper.dart';
import 'package:c6_elevate_clean_arch/domain/entities/banner_entity.dart';
import 'package:c6_elevate_clean_arch/domain/entities/category_entity.dart';
import 'package:c6_elevate_clean_arch/domain/entities/product_entity.dart';
import 'package:c6_elevate_clean_arch/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final CommerceLocalDatasource _commerceLocalDatasource;
  final CommerceApiClient _commerceApiClient;
  final CommerceMapper _commerceMapper;

  const HomeRepoImpl(
    this._commerceLocalDatasource,
    this._commerceMapper,
    this._commerceApiClient,
  );

  @override
  Future<ApiResults<List<BannerEntity>>> getBanners() => safeCall(() async {
    var response = await _commerceLocalDatasource.getBanners();
    return Success(
      _commerceMapper.mapBannersResponseListToBannersEntityList(
        response.banners ?? [],
      ),
    );
  });

  @override
  Future<ApiResults<List<CategoryEntity>>> getCategories() =>
      safeCall(() async {
        var response = await _commerceApiClient.getCategories();
        return Success(
          _commerceMapper.mapCategoryResponseListToCategoryEntityList(
            response.data ?? [],
          ),
        );
      });

  @override
  Future<ApiResults<List<ProductEntity>>> getProductsByCategory(
    String categoryId,
  ) => safeCall(() async {
    var response = await _commerceApiClient.getProducts(categoryId);
    return Success(
      _commerceMapper.mapProductResponseListToProductEntityList(
        response.data ?? [],
      ),
    );
  });
}
