import 'package:flutter/material.dart';
import 'package:flutter_moda/detay.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Material(
          child: Container(
            color: Colors.white,
            child: TabBar(
                indicatorColor: Colors.transparent,
                controller: tabController,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.more,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.navigation,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                ]),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Moda App",
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt))],
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 10),
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                children: [
                  // Profile list
                  listeElemani("assets/model1.jpeg", "assets/chanellogo.jpg"),
                  SizedBox(width: 30),
                  listeElemani("assets/model2.jpeg", "assets/louisvuitton.jpg"),
                  SizedBox(width: 30),
                  listeElemani("assets/model3.jpeg", "assets/chloelogo.png"),
                  SizedBox(width: 30),
                  listeElemani("assets/model1.jpeg", "assets/chanellogo.jpg"),
                  SizedBox(width: 30),
                  listeElemani("assets/model2.jpeg", "assets/louisvuitton.jpg"),
                  SizedBox(width: 30),
                  listeElemani("assets/model3.jpeg", "assets/chloelogo.png"),
                  SizedBox(width: 30),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 4,
                child: Container(
                  color: Colors.white,
                  height: 500,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage("assets/model1.jpeg"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daisy",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "34 minutes ago",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 10,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                            size: 22,
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "The official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends.",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            color: Colors.grey),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Detay(imgPath: "assets/modelgrid1.jpeg")));
                            },
                            child: Hero(
                              tag: "assets/modelgrid1.jpeg",
                              child: Container(
                                height: 200,
                                width:
                                    (MediaQuery.of(context).size.width - 50) / 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/modelgrid1.jpeg"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Detay(
                                          imgPath: "assets/modelgrid2.jpeg")));
                                },
                                child: Hero(
                                  tag: "assets/modelgrid2.jpeg",
                                  child: Container(
                                    height: 95,
                                    width: (MediaQuery.of(context).size.width -
                                            100) /
                                        2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/modelgrid2.jpeg"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Detay(
                                          imgPath: "assets/modelgrid3.jpeg")));
                                },
                                child: Hero(
                                  tag: "assets/modelgrid3.jpeg",
                                  child: Container(
                                    height: 95,
                                    width: (MediaQuery.of(context).size.width -
                                            100) /
                                        2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/modelgrid3.jpeg"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.brown.withAlpha(50)),
                            child: Center(
                              child: Text(
                                "# Luis vuittion",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 10,
                                    color: Colors.brown),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 25,
                            width: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.brown.withAlpha(50)),
                            child: Center(
                              child: Text(
                                "# Chloe",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 10,
                                    color: Colors.brown),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Divider(),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.reply,
                            color: Colors.grey.withAlpha(100),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "1.7k",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.grey.withAlpha(100),
                                fontSize: 16),
                          ),
                          SizedBox(width: 30),
                          Icon(
                            Icons.comment,
                            color: Colors.grey.withAlpha(100),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "325",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.grey.withAlpha(100),
                                fontSize: 16),
                          ),
                          SizedBox(width: 30),
                          Container(
                            width: MediaQuery.of(context).size.width - 280,
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "2.3k",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Colors.grey.withAlpha(100),
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listeElemani(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage(logoPath), fit: BoxFit.cover)),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.brown),
          child: Center(
            child: Text(
              "Follow",
              style: TextStyle(
                  fontFamily: "Montserrat", fontSize: 14, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
