import 'dart:convert';

import 'package:c6_elevate_clean_arch/data/datasource/contract/commerce_local_datasource.dart';
import 'package:c6_elevate_clean_arch/data/models/banners_response.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: CommerceLocalDatasource)
class CommerceLocalDatasourceImpl implements CommerceLocalDatasource {
  final AssetBundle _assetBundle;
  const CommerceLocalDatasourceImpl(this._assetBundle);

  @override
  Future<BannersResponse> getBanners() async {
    var response = await _assetBundle.loadString("assets/files/banners.json");
    return BannersResponse.fromJson(jsonDecode(response));
  }
}
