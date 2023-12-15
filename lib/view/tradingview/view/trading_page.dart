import 'package:flutter/material.dart';
import 'package:app_view_trading/view/home/model/crypto.dart';
import 'package:app_view_trading/view/tradingview/view/trading_view.dart';

class TradingPage extends StatelessWidget {
  const TradingPage({required this.crypto, super.key});
  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    return TradingView(
      crypto: crypto,
    );
  }
}
