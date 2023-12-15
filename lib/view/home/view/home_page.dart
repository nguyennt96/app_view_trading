import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_view_trading/view/home/view-model/cubit/crypto_cubit.dart';
import 'package:app_view_trading/view/home/view-model/mixin/getit_mixin.dart';
import 'package:app_view_trading/view/home/view/home_view.dart';

class HomePage extends StatelessWidget with GetItMixin {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CryptoCubit(cryptoDataSource: dioData())..ranking(),
      child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const HomeView()),
    );
  }
}
