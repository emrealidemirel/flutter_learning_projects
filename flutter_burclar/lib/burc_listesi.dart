import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_item.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:flutter_burclar/data/strings.dart';

// ignore: must_be_immutable
class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi({super.key}) {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(
            "Burçlar Listesi",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          // ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.cyan,
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                  Colors.pink,
                  Colors.purple
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return BurcItem(listelenenBurc: tumBurclar[index]);
            },
            itemCount: tumBurclar.length,
          ),
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var kucukResim = '${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png';
      var buyukResim =
          '${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png';

      Burc eklenecekBurc =
          Burc(burcAdi, burcTarihi, burcDetay, kucukResim, buyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
