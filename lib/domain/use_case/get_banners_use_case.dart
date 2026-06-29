import 'package:c6_elevate_clean_arch/core/network/api_results.dart';
import 'package:c6_elevate_clean_arch/domain/entities/banner_entity.dart';
import 'package:c6_elevate_clean_arch/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBannersUseCase {
  final HomeRepo _homeRepo;

  const GetBannersUseCase(this._homeRepo);

  Future<ApiResults<List<BannerEntity>>> call() => _homeRepo.getBanners();
}
