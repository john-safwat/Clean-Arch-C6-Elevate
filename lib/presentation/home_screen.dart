
import 'package:c6_elevate_clean_arch/core/network/api_results.dart';
import 'package:c6_elevate_clean_arch/data/repo/home_repo_impl.dart';
import 'package:c6_elevate_clean_arch/domain/entities/banner_entity.dart';
import 'package:c6_elevate_clean_arch/domain/repo/home_repo.dart';
import 'package:dio/dio.dart';

import '../data/api/commerce_api_client.dart';
import '../data/datasource/impl/commerce_local_datasource_impl.dart';
import '../data/mapper/commerce_mapper.dart';


void main()async{

  HomeRepo homeRepo = HomeRepoImpl(
    CommerceLocalDatasourceImpl(rootBundle),
    CommerceMapper(),
    CommerceApiClient(Dio()),
  );
    var response = await homeRepo.getBanners();
    switch (response) {
      case Success<List<BannerEntity>>():
      case Failure<List<BannerEntity>>():
    }
}