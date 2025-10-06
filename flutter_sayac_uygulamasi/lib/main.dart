import 'package:flutter/material.dart';
import 'package:flutter_sayac_uygulamasi/sayac_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Sayaç Uygulaması'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final SayacViewModel sayacViewModel = SayacViewModel();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: StreamBuilder(
          initialData: sayacViewModel.init(),
          stream: sayacViewModel.sayacStream,
          builder:
              (context, snapshot) => Text("$title Sayaç Değeri: ${snapshot.data.toString()}"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            StreamBuilder<int>(
              initialData: sayacViewModel.init(),
              stream: sayacViewModel.sayacStream,
              builder:
                  (BuildContext context, AsyncSnapshot snapshot) => Text(
                    snapshot.hasData ? snapshot.data.toString() : "Değer yok",
                    style: TextStyle(fontSize: 36),
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              sayacViewModel.arttir();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              sayacViewModel.azalt();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
