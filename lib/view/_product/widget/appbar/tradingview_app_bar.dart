import 'package:flutter/material.dart';
import 'package:app_view_trading/core/component/iconbutton/appbar_back_icon.dart';
import 'package:app_view_trading/core/component/iconbutton/appbar_star_icon.dart';
import 'package:app_view_trading/core/component/iconbutton/apppbar_notification_icon.dart';
import 'package:app_view_trading/core/component/text/label_small_text.dart';
import 'package:app_view_trading/core/component/text/title_medium_text.dart';
import 'package:app_view_trading/product/init/locale/project_keys.dart';
import 'package:app_view_trading/view/home/model/crypto.dart';

class TradingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TradingAppBar({
    required this.crypto,
    super.key,
  });
  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const AppBarBackIconButton(),
      title: Column(
        children: [
          TitleMediumText(text: crypto.symbol.toString()),
          const LabelSmallText(text: ProjectKeys.globalAverage),
        ],
      ),
      actions: const [
        AppBarNotificationIconButton(),
        AppBarStarIconButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
