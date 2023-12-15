import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_view_trading/core/enum/base_status.dart';
import 'package:app_view_trading/product/init/locale/project_keys.dart';
import 'package:app_view_trading/product/widget/card/crypto_card.dart';
import 'package:app_view_trading/view/home/model/crypto.dart';
import 'package:app_view_trading/view/home/view-model/cubit/crypto_cubit.dart';
import 'package:app_view_trading/view/home/view-model/cubit/crypto_state.dart';
import 'package:app_view_trading/view/home/view/home_news_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static final List<Widget> pages = <Widget>[
    const HomeNewView(),
    BlocBuilder<CryptoCubit, CryptoState>(
      builder: (context, state) {
        switch (state.status) {
          case BaseStatus.initial:
            return const SizedBox.shrink();
          case BaseStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case BaseStatus.completed:
            return CryptoList(data: state as CryptoCompleted);
          case BaseStatus.error:
            return const Center(child: Text(ProjectKeys.error));
        }
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News CryTrade",
        ),
      ),
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paid_outlined),
            label: 'Coins View',
          ),
        ],
      ),
    );
  }
}

class CryptoList extends StatelessWidget {
  const CryptoList({
    required this.data,
    super.key,
  });

  final CryptoCompleted data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.response.length,
      itemBuilder: (BuildContext context, int index) {
        return CryptoCard(crypto: data.response[index] as Crypto);
      },
    );
  }
}
