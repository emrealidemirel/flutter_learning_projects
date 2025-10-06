import 'package:dinamik_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/ders.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/harf_dropdown_widgtet.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();

  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false, // ekran yan çevrildiğinde klavye açıkken alınan hata için
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStil,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    ortalama: DataHelper.ortalamaHesapla(),
                    dersSayisi: DataHelper.tumEklenenDersler.length),
              ),
            ],
          ),
          Expanded(child: DersListesi(
            ondissMiss: (index) {
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {});
            },
          ))
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: Sabitler.yatayPadding7, child: _buildTextFormField()),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                      padding: Sabitler.yatayPadding7,
                      child: HarfDropdownWidgtet(
                        onHarfSecildi: (harf) {
                          secilenHarfDegeri = harf;
                        },
                      ))),
              Expanded(
                  child: Padding(
                      padding: Sabitler.yatayPadding7,
                      child: KrediDropdownWidget(
                        onKrediSecildi: (kredi) {
                          secilenKrediDegeri = kredi;
                        },
                      ))),
              IconButton(
                onPressed: () {
                  _dersEkleVeOrtalamaHesapla();
                },
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 7,
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.isEmpty) {
          return "Ders adını giriniz.";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Ders Adı",
          hintStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade200),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
