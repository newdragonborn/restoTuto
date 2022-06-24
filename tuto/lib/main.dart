import 'dart:convert';
import 'package:tuto/item.dart';
import 'package:tuto/user.dart';
import 'package:tuto/itemDetail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KG Afriques',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    List<ItemMenu> list = [];
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                      Text(
                        "KG Afrique",
                        style: TextStyle(fontSize: 22),
                      ),
                      IconButton(
                          icon: Icon(Icons.person),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => User()));
                          }),
                    ],
                  ),
                ),
                BannerWidgetArea(),
                Container(
                  height: screenHeight - screenWidth * 9 / 16,
                  child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString('assets/data.json'),
                    builder: (context, snapshot) {
                      var dataN = jsonDecode(snapshot.data.toString());
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String finalString = "";
                            List<dynamic> datalist = dataN[index]["placeItems"];
                            datalist.forEach((item) {
                              finalString = finalString + item + " | ";
                            });
                            ItemMenu itemMenu = new ItemMenu(
                                dataN[index]["placeImage"],
                                dataN[index]["placeName"],
                                finalString,
                                dataN[index]["prix"]);
                            list.add(itemMenu);
                            return ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ItemDetail(item: list[index])));
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.zero, // Set this
                                padding: EdgeInsets.all(0), // and this
                              ),
                              child: Card(
                                margin: EdgeInsets.all(0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white38,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                spreadRadius: 1.0,
                                                blurRadius: 3.0,
                                              )
                                            ],
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                child: new Image.asset(
                                                  dataN[index]['placeImage'],
                                                  width: 70,
                                                  height: 70,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 210,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      2, 3, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 0, 10),
                                                        child: Text(
                                                          dataN[index]
                                                              ['placeName'],
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                      Text(
                                                        finalString,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.white),
                                                        maxLines: 1,
                                                      ),
                                                      Text(
                                                        "Prix: ${dataN[index]['prix']} FCFA",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.white),
                                                        maxLines: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            );
                          },
                          itemCount: dataN == null ? 0 : dataN.length,
                        );
                      } else {
                        return CircularProgressIndicator(
                          color: Colors.black,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var bannerItems = [
  "chevremacabo",
  "cornchaff",
  "erufufu",
  "macabomaler",
  "piller",
  "yassa"
];
var bannerImages = [
  "assets/images/chevremacabo.jpeg",
  "assets/images/cornchaff.jpeg",
  "assets/images/erufufu.jpeg",
  "assets/images/macabomaler.jpeg",
  "assets/images/piller.jpeg",
  "assets/images/yassa.jpeg",
];

class BannerWidgetArea extends StatelessWidget {
  const BannerWidgetArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    PageController controller =
        PageController(viewportFraction: 0.65, initialPage: 1);

    List<Widget> banners = <Widget>[];

    for (var i = 0; i < bannerItems.length; i++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(15.00),
        child: Container(
          child: Stack(fit: StackFit.expand, children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 25.0,
                      spreadRadius: 1.0,
                    )
                  ]),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                bannerImages[i],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(1)
                      ])),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    bannerItems[i],
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Text(
                    "Plat du jour",
                    style: TextStyle(fontSize: 12, color: Colors.white38),
                  )
                ],
              ),
            ),
          ]),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenWidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
