import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRenk = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => appBarRenkBul());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        primary: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              expandedHeight: 250,
              pinned: true,
              backgroundColor: appBarRenk,
              foregroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "${widget.secilenBurc.burcAdi} Burcu Özellikleri",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                background: Image.asset(
                    // ignore: prefer_interpolation_to_compose_strings
                    "images/" + widget.secilenBurc.burcBuyukResim,
                    fit: BoxFit.cover),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Text(widget.secilenBurc.burcDetayi,
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void appBarRenkBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        // ignore: prefer_interpolation_to_compose_strings
        AssetImage("images/" + widget.secilenBurc.burcBuyukResim));
    setState(() {});
    appBarRenk = _generator.dominantColor!.color;
  }
}
