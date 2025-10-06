import 'package:flutter/material.dart';
import 'package:flutter_moda/ana_sayfa.dart';
class Detay extends StatefulWidget {
  final imgPath;
  const Detay({super.key, this.imgPath});

  @override
  State<Detay> createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            Hero(
              tag: widget.imgPath,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              left: 15,
              right: 15,
              bottom: 15,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 4,
                child: Container(
                  height: 240,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  image: DecorationImage(
                                      image: AssetImage("assets/dress.jpg"),
                                      fit: BoxFit.contain)),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "LAMINATED",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Louis Vuitton",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 30,
                                width: MediaQuery.of(context).size.width - 180,
                                child: Text(
                                  "One button V-neck sling long-sleeved waist female stitching dress",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      color: Colors.grey.withAlpha(120)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$6500",
                              style: TextStyle(
                                  fontFamily: "Montserrat", fontSize: 22),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AnaSayfa()));
                              },
                              shape: CircleBorder(),
                              mini: true,
                              backgroundColor: Colors.brown,
                              foregroundColor: Colors.white,
                              child: Icon(Icons.arrow_forward_ios),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              left: 50,
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    color: Colors.black.withAlpha(100),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "LAMINATED",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
