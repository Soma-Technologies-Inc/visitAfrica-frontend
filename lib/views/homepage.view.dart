import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:visistafri/models/mostVisited.models.dart';
import 'package:visistafri/models/place.models.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class Homepage extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> kWords;
  int selectedIndex = 0;

  List<Place> slides = [
    Place('SERENGETI', "assets/images/af.JPEG", 'Nairobi,Tanzania',
        'Serengeti National Park,Nothern Tanzania'),
    Place('KCC', "assets/images/kc.JPG", 'Kigali,Rwanda',
        'Kigali Convetion Center, Kigali Rwanda'),
    Place('Mega Mixed', "assets/images/mega.JPG", 'Johannesburg,South-Africa',
        'Mega Mixed Building, Johannesburg South-Africa'),
    Place(
        'Virunga Park',
        "assets/images/vc.JPG",
        'Democratic Republic Of Congo',
        'Mount Nyiragongo, Democratic Republic Of Congo'),
    Place('Nyungwe National Park', "assets/images/cnp.JPG", 'Nyamasheke,Rwanda',
        'Nyungwe Canopy Walk, Nyamasheke Rwanda')
  ];
  List<MostVisted> mostVisitedCategories = [
    MostVisted('Buildings', [
      Place('KCC', "assets/images/kc.JPG", 'Kigali,Rwanda',
          'Kigali Convetion Center, Kigali Rwanda'),
      Place('KCC', "assets/images/ac.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/Image1.PNG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/ch.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/st.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/ac.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
    ]),
    MostVisted('Beach', [
      Place('KCC', "assets/images/saga.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/tm.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/bc.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/pb.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/mb.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/wb.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
    ]),
    MostVisted('Volcanoes', [
      Place('KCC', "assets/images/vc.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('vcC', "assets/images/rw.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('vcC', "assets/images/vc2.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('vcC', "assets/images/vc3.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('vcC', "assets/images/vc4.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('vcC', "assets/images/vc5.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
    ]),
    MostVisted('Canopy', [
      Place('KCC', "assets/images/cnp.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/cp.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/cp2.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/cp3.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/cp4.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/cp5.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
    ]),
    MostVisted('Parks', [
      Place('KCC', "assets/images/af.JPEG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp2.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp3.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp4.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp5.JPG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffB15C1E)),
        elevation: 0,
        title: Text(
          'Visit Africa',
          style: TextStyle(
            color: Color(0xffB15C1E),
          ),
        ),
        // iconTheme: new IconThemeData(color: Colors.green),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xffB15C1E),
            ),
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.list));
            },
          ),
        ],
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Colors.white, //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            // data: Theme.of(context).copyWith(
            //          canvasColor: Colors.blue, //This will change the drawer background to blue.
            //          //other styles
            //       ),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 364,
                  child: DrawerHeader(
                    child: Container(
                        child: Stack(
                      children: [
                        Container(
                          // padding: EdgeInsets.only(
                          //   right: 0,
                          // ),
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/cover.PNG')),
                          width: 600,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 110,
                            right: 100,
                          ),
                          child: CircularProfileAvatar(
                            null,
                            child: Icon(
                              Icons.person,
                              size: 90,
                              color: Color(0xffB15C1E),
                            ),
                            borderWidth: 2,
                            elevation: 5,
                            radius: 50,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 220,
                          ),
                          child: Text('Diane NGOGA',
                              style: TextStyle(
                                  color: Color(0xffB15C1E), fontSize: 30)),
                        )
                      ],
                    )),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 0,
                  ),
                  child: ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Color(0xffB15C1E),
                        ),
                        Text('Edit My Profile'),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 0),
                  child: ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Color(0xffB15C1E),
                        ),
                        Text('Notifications'),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 0,
                  ),
                  child: ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.assignment_return,
                          color: Color(0xffB15C1E),
                        ),
                        Text('Log Out'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: getSlides(),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 16,
              left: 16,
            ),
            child: Text(
              'Most Visited Places',
              style: TextStyle(
                color: Color(0xffB15C1E),
                fontSize: 18,
              ),
            ),
          ),
          Container(
            height: 37,
            child: ListView.builder(
              itemCount: mostVisitedCategories.length,
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey)),
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    color: selectedIndex == index
                        ? Color(0xffB15C1E)
                        : Colors.white,
                    textColor: selectedIndex == index
                        ? Colors.white
                        : Color(0xffB15C1E),
                    child: Text(
                      mostVisitedCategories[index].name,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            //childAspectRatio: 0.8,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(
                mostVisitedCategories[selectedIndex].places.length, (index) {
              return Column(
                children: [
                  Image.asset(
                    mostVisitedCategories[selectedIndex].places[index].image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      mostVisitedCategories[selectedIndex]
                          .places[index]
                          .description,
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  List<Widget> getSlides() {
    return slides
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item.image,
                            fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(item.description,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = [
    " Algeria",
    " Algeria",
    " Benin",
    "Botswana",
    "Burundi",
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
