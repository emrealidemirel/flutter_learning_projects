import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropdownWidgtet extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidgtet({required this.onHarfSecildi, super.key});
  @override
  State<HarfDropdownWidgtet> createState() => _HarfDropdownWidgtetState();
}

class _HarfDropdownWidgtetState extends State<HarfDropdownWidgtet> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100,
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
          elevation: 16,
          iconEnabledColor: Sabitler.anaRenk,
          value: secilenHarfDegeri,
          items: DataHelper.tumDerslerinHarfleri(),
          onChanged: (deger) {
            setState(() {
              secilenHarfDegeri = deger!;
              widget.onHarfSecildi(secilenHarfDegeri);
            });
          }),
    );
  }
}
