import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeigth(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(Constants.title, style: Constants.getTitleStyle())),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(Constants.pokeballImgUrl,
                width: UIHelper.getAppTitleWidgetWidth(), fit: BoxFit.fitWidth),
          )
        ],
      ),
    );
  }
}
