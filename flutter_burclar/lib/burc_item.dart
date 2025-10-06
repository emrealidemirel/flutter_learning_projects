import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, super.key});

  @override
  Widget build(BuildContext context) {
    var myTextTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.grey.shade300,
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/burcDetay", arguments: listelenenBurc);
            },
            leading: Image.asset(
              // ignore: prefer_interpolation_to_compose_strings
              "images/" + listelenenBurc.burcKucukResim,
            ),
            title: Text(
              listelenenBurc.burcAdi,
              style: myTextTheme.titleLarge,
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: myTextTheme.titleSmall,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
