import 'package:c6_elevate_clean_arch/core/network/api_results.dart';
import 'package:c6_elevate_clean_arch/domain/entities/category_entity.dart';
import 'package:c6_elevate_clean_arch/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase{

  HomeRepo homeRepo;

  GetCategoriesUseCase(this.homeRepo);


  Future<ApiResults<List<CategoryEntity>>> call() => homeRepo.getCategories();

}