import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap_makinesi/home_page/view_model/cubit/hesap_makinesi_cubit.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController sayi1controller = TextEditingController();
  final TextEditingController sayi2controller = TextEditingController();
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hesap Makinesi")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sayi1controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "1. Sayı",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: sayi2controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "2. Sayı",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final a = double.tryParse(sayi1controller.text) ?? 0;
                    final b = double.tryParse(sayi2controller.text) ?? 0;
                    sayi1controller.clear();
                    sayi2controller.clear();
                    context.read<HesapMakinesiCubit>().topla(a, b);
                  },
                  child: Text("+", style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    final a = double.tryParse(sayi1controller.text) ?? 0;
                    final b = double.tryParse(sayi2controller.text) ?? 0;
                    sayi1controller.clear();
                    sayi2controller.clear();
                    context.read<HesapMakinesiCubit>().cikar(a, b);
                  },
                  child: Text("-", style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    final a = double.tryParse(sayi1controller.text) ?? 0;
                    final b = double.tryParse(sayi2controller.text) ?? 0;
                    sayi1controller.clear();
                    sayi2controller.clear();
                    context.read<HesapMakinesiCubit>().carp(a, b);
                  },
                  child: Text("x", style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    final a = double.tryParse(sayi1controller.text) ?? 0;
                    final b = double.tryParse(sayi2controller.text) ?? 0;
                    sayi1controller.clear();
                    sayi2controller.clear();
                    context.read<HesapMakinesiCubit>().bol(a, b);
                  },
                  child: Text("÷", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: BlocBuilder<HesapMakinesiCubit, HesapMakinesiState>(
                builder: (context, state) {
                  return Text(state.sonuc, style: TextStyle(fontSize: 20));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
