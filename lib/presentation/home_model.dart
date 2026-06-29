import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c6_elevate_clean_arch/core/base/resources.dart';
import 'package:c6_elevate_clean_arch/core/network/api_results.dart';
import 'package:c6_elevate_clean_arch/domain/entities/banner_entity.dart';
import 'package:c6_elevate_clean_arch/domain/entities/category_entity.dart';
import 'package:c6_elevate_clean_arch/domain/use_case/get_banners_use_case.dart';
import 'package:c6_elevate_clean_arch/domain/use_case/get_categories_use_case.dart';
import 'package:c6_elevate_clean_arch/presentation/home_events.dart';
import 'package:c6_elevate_clean_arch/presentation/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Cubit<HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBannersUseCase getBannersUseCase;

  HomeBloc(this.getBannersUseCase, this.getCategoriesUseCase)
    : super(HomeState(Resources.init(), Resources.init()));

  final StreamController<HomeUIEvents> _uiController =
      StreamController.broadcast();

  Stream<HomeUIEvents> get uiStream => _uiController.stream;

  Future<void> doIntent(HomeEvents event) async {
    switch (event) {
      case LoadData():
        {
          _loadHomeData(event);
        }
    }
  }

  Future<void> _loadHomeData(LoadData event) async {
    emit(
      state.copyWith(
        categories: Resources.loading(),
        banners: Resources.loading(),
      ),
    );
    var categoriesResponse = await getCategoriesUseCase.call();
    var bannersResponse = await getBannersUseCase.call();

    switch (categoriesResponse) {
      case Success<List<CategoryEntity>>():
        {
          emit(
            state.copyWith(
              categories: Resources.success(data: categoriesResponse.data),
            ),
          );
        }
      case Failure<List<CategoryEntity>>():
        {
          emit(
            state.copyWith(
              categories: Resources.error(message: "No Categories"),
            ),
          );
        }
    }

    switch (bannersResponse) {
      case Success<List<BannerEntity>>():
        {
          emit(
            state.copyWith(
              banners: Resources.success(data: bannersResponse.data),
            ),
          );
        }
      case Failure<List<BannerEntity>>():
        {
          emit(state.copyWith(banners: Resources.error(message: "No Banners")));
        }
    }
  }
}
