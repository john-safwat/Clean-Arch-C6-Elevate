import 'package:c6_elevate_clean_arch/core/base/resources.dart';
import 'package:c6_elevate_clean_arch/core/di/di.dart';
import 'package:c6_elevate_clean_arch/data/api/commerce_api_client.dart';
import 'package:c6_elevate_clean_arch/data/datasource/impl/commerce_local_datasource_impl.dart';
import 'package:c6_elevate_clean_arch/data/mapper/commerce_mapper.dart';
import 'package:c6_elevate_clean_arch/data/repo/home_repo_impl.dart';
import 'package:c6_elevate_clean_arch/domain/use_case/get_banners_use_case.dart';
import 'package:c6_elevate_clean_arch/domain/use_case/get_categories_use_case.dart';
import 'package:c6_elevate_clean_arch/presentation/home_events.dart';
import 'package:c6_elevate_clean_arch/presentation/home_model.dart';
import 'package:c6_elevate_clean_arch/presentation/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeBloc bloc = getIt();

  @override
  void initState() {
    super.initState();
    bloc.doIntent(LoadData());
    bloc.uiStream.listen((event) {
      switch (event) {
        case ShowMessage():
          {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(title: Text("You have reached 10"));
              },
            );
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .stretch,
              children: [
                switch (state.categories.status) {
                  Status.success => Image.network((state.categories.data??[]).first.image),
                  Status.loading => CircularProgressIndicator(),
                  Status.init => CircularProgressIndicator(),
                  Status.error => Text(state.categories.message??"")
                },
                switch (state.banners.status) {
                  Status.success => Placeholder(),
                  Status.loading => CircularProgressIndicator(),
                  Status.init => CircularProgressIndicator(),
                  Status.error => Text(state.categories.message??"")
                },
              ],
            ),
          );
        },
      ),
    );

    // return StreamBuilder<HomeState>(
    //   stream: homeModel.stateStream,
    //   builder: (context , state) {
    //     return Scaffold(
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //         homeModel.doIntent(UpdateCounter());
    //       },
    //       child: Icon(Icons.add),
    //     ),
    //     body: Column(
    //       mainAxisAlignment: .center,
    //       crossAxisAlignment: .stretch,
    //       children: [
    //         Center(child: Text(homeModel.state.message)),
    //         SizedBox(height: 16),
    //         Text(homeModel.state.counter.toString()),
    //       ],
    //     ),
    //   );
    //   },
    // );
  }
}
