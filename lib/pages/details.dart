import 'package:flutter/material.dart';
import 'package:indonesianspecialfood/util/menu.dart';
import 'package:indonesianspecialfood/widget/icon_badge.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.all(0),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("${menu[1]["img"]}"),
                        fit: BoxFit.cover)),
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: IconBadge(
                            icon: Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: IconBadge(
                                icon: Icons.favorite_outline,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: IconBadge(
                                icon: Icons.share,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: size.height * 0.00001),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 7,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["name"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.blueGrey[300],
                          ),
                          SizedBox(width: 3),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${menu[1]["location"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.blueGrey[300],
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["description"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Center(
                        child: Text(
                          "How To Make",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bahan-bahan :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["title1"] ?? ""}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["bahan1"] ?? ""}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["title2"] ?? ""}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["bahan2"] ?? ""}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["title3"] ?? ""}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["bahan3"] ?? ""}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["title4"] ?? ""}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["bahan4"] ?? ""}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Langkah-langkah :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${menu[1]["langkah"] ?? ""}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
