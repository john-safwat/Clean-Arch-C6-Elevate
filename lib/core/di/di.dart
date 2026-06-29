import 'package:c6_elevate_clean_arch/core/di/di.config.dart';
import 'package:c6_elevate_clean_arch/core/di/network_module.dart';
import 'package:c6_elevate_clean_arch/data/api/commerce_api_client.dart';
import 'package:c6_elevate_clean_arch/data/datasource/contract/commerce_local_datasource.dart';
import 'package:c6_elevate_clean_arch/data/datasource/impl/commerce_local_datasource_impl.dart';
import 'package:c6_elevate_clean_arch/data/mapper/commerce_mapper.dart';
import 'package:c6_elevate_clean_arch/data/repo/home_repo_impl.dart';
import 'package:c6_elevate_clean_arch/domain/repo/home_repo.dart';
import 'package:c6_elevate_clean_arch/domain/use_case/get_banners_use_case.dart';
import 'package:c6_elevate_clean_arch/domain/use_case/get_categories_use_case.dart';
import 'package:c6_elevate_clean_arch/presentation/home_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

//
// void configureDependencies() {
//   getIt.registerSingleton<Dio>(provideDio());
//   getIt.registerSingleton<AssetBundle>(rootBundle);
//   getIt.registerSingleton<CommerceApiClient>(CommerceApiClient(getIt()));
//   getIt.registerFactory<CommerceLocalDatasource>(
//     () => CommerceLocalDatasourceImpl(getIt()),
//   );
//   getIt.registerFactory<CommerceMapper>(() => CommerceMapper());
//   getIt.registerFactory<HomeRepo>(
//     () => HomeRepoImpl(getIt(), getIt(), getIt()),
//   );
//   getIt.registerFactory<GetCategoriesUseCase>(
//     () => GetCategoriesUseCase(getIt()),
//   );
//   getIt.registerFactory<GetBannersUseCase>(() => GetBannersUseCase(getIt()));
//   getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt(), getIt()));
// }
