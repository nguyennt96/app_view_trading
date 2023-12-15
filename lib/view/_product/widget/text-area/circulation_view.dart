import 'package:flutter/material.dart';
import 'package:app_view_trading/product/init/locale/project_keys.dart';
import 'package:app_view_trading/product/widget/text-area/custom_multi_text_area.dart';
import 'package:app_view_trading/view/home/model/crypto.dart';

class CirculationView extends StatelessWidget {
  const CirculationView({
    required this.crypto,
    super.key,
  });

  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    return CustomMultiTextArea(
      title: ProjectKeys.circulation(crypto.symbol.toString()),
      description: crypto.quote?.uSD?.marketCapDominance?.toStringAsFixed(2) ??
          ProjectKeys.notFound,
    );
  }
}
