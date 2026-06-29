
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AssetBundleModule {

  @singleton
  AssetBundle provideAssetBundle() => rootBundle;

}