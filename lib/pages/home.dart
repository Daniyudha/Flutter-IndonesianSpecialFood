import 'package:flutter/material.dart';
import 'package:indonesianspecialfood/util/places.dart';
import 'package:indonesianspecialfood/widget/horizontal_place_item.dart';
import 'package:indonesianspecialfood/widget/vertical_place_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text(
            'Indonesian Special Food',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(
                  context: context, delegate: CustomSearchDelegate()),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Recommendation",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildHorizontalList(context),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Menu Of Indonesian Food",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildVerticalList(),
        ],
      ),
    );
  }

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places == null ? 0.0 : places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places.reversed.toList()[index];
          return HorizontalPlaceItem(place: place);
        },
      ),
    );
  }

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: places == null ? 0 : places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places[index];
          return VerticalPlaceItem(place: place);
        },
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final cities = [
    "bandung",
    "jogja",
    "jakarta",
    "surabaya",
    "bali",
    "lamongan",
    "aceh",
    "padang",
    "Semarang"
  ];

  final recentCities = [
    "jakarta",
    "surabaya",
    "bali",
    "Semarang",
  ];

  @override
  List<Widget> buildActions(BuildContext context) => [
        if (query.isNotEmpty)
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              query = "";
              showSuggestions(context);
            },
          )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        tooltip: 'Back',
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildResults(BuildContext context) => Text(" ");

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.blue,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.black),
      primaryColorBrightness: Brightness.dark,
      textTheme: theme.textTheme.copyWith(),
      // these ↓ do not work ☹️
      appBarTheme:
          theme.appBarTheme.copyWith(color: Colors.black12, elevation: 0),
      inputDecorationTheme:
          theme.inputDecorationTheme.copyWith(border: UnderlineInputBorder()),
    );
  }
}
