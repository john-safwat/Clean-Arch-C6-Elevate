import 'package:c6_elevate_clean_arch/core/base/resources.dart';
import 'package:c6_elevate_clean_arch/domain/entities/banner_entity.dart';
import 'package:c6_elevate_clean_arch/domain/entities/category_entity.dart';

class HomeState {
  Resources<List<CategoryEntity>> categories;
  Resources<List<BannerEntity>> banners;

  HomeState(this.categories, this.banners);

  HomeState copyWith({
    Resources<List<CategoryEntity>>? categories,
    Resources<List<BannerEntity>>? banners,
}) {
    return HomeState(
      categories ?? this.categories,
      banners ?? this.banners,
    );
  }
}
