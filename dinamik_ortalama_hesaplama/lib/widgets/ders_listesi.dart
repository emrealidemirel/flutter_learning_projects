import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function ondissMiss;
  const DersListesi({required this.ondissMiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                //direction: DismissDirection.startToEnd, // tek bir yöne kaydırarak kapatmak için
                onDismissed: (a) {
                  ondissMiss(index);
                  // DataHelper.tumEklenenDersler.removeAt(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          ((tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri))
                              .toStringAsFixed(0),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      subtitle: Text(
                          "Not Değeri: ${tumDersler[index].harfDegeri}, Kredi Değeri:${tumDersler[index].krediDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
            "Lütfen ders ekleyin.",
            style: TextStyle(fontSize: 18),
          ));
  }
}
