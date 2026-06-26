
import 'package:c6_elevate_clean_arch/data/models/banners_response.dart';

abstract class CommerceLocalDatasource{
  Future<BannersResponse> getBanners();
}