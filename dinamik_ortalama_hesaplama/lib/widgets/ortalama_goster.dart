import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:flutter/widgets.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster(
      {super.key, required this.ortalama, required this.dersSayisi});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders girildi." : "Ders Giriniz",
          style: Sabitler.ortalamaGosterStyle,
        ),
        Text(
          ortalama >= 0 ? "${ortalama.toStringAsFixed(2)} " : "0.0",
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.ortalamaGosterStyle,
        )
      ],
    );
  }
}
