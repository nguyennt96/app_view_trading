import 'package:flutter/material.dart';
import 'package:app_view_trading/core/constants/color/color_constant.dart';
import 'package:app_view_trading/core/enum/project_icon.dart';

class AppBarBackIconButton extends StatelessWidget {
  const AppBarBackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        ProjectIcons.back.getIconData,
        color: ProjectColors.white,
      ),
    );
  }
}
