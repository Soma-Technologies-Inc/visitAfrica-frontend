import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:visistafri/models/mostVisited.models.dart';
import 'package:readmore/readmore.dart';
import 'package:visistafri/models/place.models.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:visistafri/views/signup.views.dart';
import 'package:visistafri/views/SpecificCountry.view.dart';
import 'package:visistafri/widgets/smallbutton.widget.dart';

class Homepage extends StatefulWidget {
  final String login;
  Homepage({Key key, @required this.login}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> list = List.generate(10, (index) => "Text $index");
  @override
  List<String> kWords;
  int selectedIndex = 0;

  List<Place> slides = [
    Place('SERENGETI', "assets/images/af.JPEG", 'Nairobi,Tanzania',
        'Serengeti National Park,Nothern Tanzania'),
    Place('KCC', "assets/images/kc.jpg", 'Kigali,Rwanda',
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
      Place('Kigali Convetion Center', "assets/images/kc.jpg", 'Kigali,Rwanda',
          'Kigali Convetion Center'),
      Place('Round Building', "assets/images/ac.JPG", 'Kigali,Rwanda',
          'Round Building'),
      Place('Nairobi Tower', "assets/images/Image1.PNG", 'Kigali,Rwanda',
          'Nairobi Tower'),
      Place('South Tradition Building', "assets/images/ch.JPG", 'Kigali,Rwanda',
          'South Tradition Building'),
      Place('Front Bended Building', "assets/images/st.JPG", 'Kigali,Rwanda',
          'Front Bended Building'),
      Place('Commercial Building', "assets/images/ac.JPG", 'Kigali,Rwanda',
          'Commercial Building'),
    ]),
    MostVisted('Beach', [
      Place('Kenya Long Beach', "assets/images/saga.JPG", 'Kigali,Rwanda',
          'Kenya Long Beach'),
      Place('Tamu-Tamu Beach', "assets/images/tm.JPG", 'Kigali,Rwanda',
          'Tamu-Tamu Beach'),
      Place('Saga Plage Burundi', "assets/images/bc.JPG", 'Kigali,Rwanda',
          'Saga Plage Burundi'),
      Place('Tamu-Tamu Beach', "assets/images/pb.JPG", 'Kigali,Rwanda',
          'Tamu-Tamu Beach'),
      Place('Saga Plage Burundi', "assets/images/mb.JPG", 'Kigali,Rwanda',
          'Saga Plage Burundi'),
      Place('Kenya Long Beach', "assets/images/wb.JPG", 'Kigali,Rwanda',
          'Kenya Long Beach'),
    ]),
    MostVisted('Volcanoes', [
      Place('Mount Nyiragongo', "assets/images/vc.JPG", 'Kigali,Rwanda',
          'Mount Nyiragongo'),
      Place('Mount Kalisimbi', "assets/images/rw.JPG", 'Kigali,Rwanda',
          'Mount Kalisimbi'),
      Place('Mount Muhabura', "assets/images/vc2.JPG", 'Kigali,Rwanda',
          'Mount Muhabura'),
      Place('Mount Sabyinyo', "assets/images/vc3.JPG", 'Kigali,Rwanda',
          'Mount Sabyinyo'),
      Place('Mount Bisoke', "assets/images/vc4.JPG", 'Kigali,Rwanda',
          'Mount Bisoke'),
      Place('Mount Kilimandjalo', "assets/images/vc5.JPG", 'Kigali,Rwanda',
          'Mount Kilimandjalo'),
    ]),
    MostVisted('Canopy', [
      Place('Nyungwe Canopy', "assets/images/cnp.JPG", 'Kigali,Rwanda',
          'Nyungwe Canopy'),
      Place(
          'DRC Canopy', "assets/images/cp.JPG", 'Kigali,Rwanda', 'DRC Canopy'),
      Place('Tanzania Canopy', "assets/images/cp2.JPG", 'Kigali,Rwanda',
          'Tanzania Canopy'),
      Place('South Sudan Canopy', "assets/images/cp3.JPG", 'Kigali,Rwanda',
          'South Sudan Canopy'),
      Place('SouthAfrica Canopy', "assets/images/cp4.JPG", 'Kigali,Rwanda',
          'SouthAfrica Canopy'),
      Place('Gabon Canopy', "assets/images/cp5.JPG", 'Kigali,Rwanda',
          'Gabon Canopy'),
    ]),
    MostVisted('Parks', [
      Place('KCC', "assets/images/af.JPEG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp.JPG", 'Kigali,Rwanda',
          'Akagera National Park'),
      Place('KCC', "assets/images/kp2.JPG", 'Kigali,Rwanda',
          'Virunga National Park'),
      Place('KCC', "assets/images/kp3.JPG", 'Kigali,Rwanda',
          'Amzon National Park'),
      Place('KCC', "assets/images/kp4.JPG", 'Kigali,Rwanda',
          'Kenyan National Park'),
      Place(
          'KCC', "assets/images/kp5.JPG", 'Kigali,Rwanda', 'DRC National Park'),
      Place('KCC', "assets/images/af.JPEG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp.JPG", 'Kigali,Rwanda',
          'Akagera National Park'),
      Place('KCC', "assets/images/kp2.JPG", 'Kigali,Rwanda',
          'Virunga National Park'),
      Place('KCC', "assets/images/kp3.JPG", 'Kigali,Rwanda',
          'Amzon National Park'),
      Place('KCC', "assets/images/kp4.JPG", 'Kigali,Rwanda',
          'Kenyan National Park'),
      Place(
          'KCC', "assets/images/kp5.JPG", 'Kigali,Rwanda', 'DRC National Park'),
      Place(
          'KCC', "assets/images/kp5.JPG", 'Kigali,Rwanda', 'DRC National Park'),
      Place('KCC', "assets/images/af.JPEG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp.JPG", 'Kigali,Rwanda',
          'Akagera National Park'),
      Place('KCC', "assets/images/kp2.JPG", 'Kigali,Rwanda',
          'Virunga National Park'),
      Place('KCC', "assets/images/kp3.JPG", 'Kigali,Rwanda',
          'Amzon National Park'),
      Place('KCC', "assets/images/kp4.JPG", 'Kigali,Rwanda',
          'Kenyan National Park'),
      Place(
          'KCC', "assets/images/kp5.JPG", 'Kigali,Rwanda', 'DRC National Park'),
      Place(
          'KCC', "assets/images/kp5.JPG", 'Kigali,Rwanda', 'DRC National Park'),
      Place('KCC', "assets/images/af.JPEG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp.JPG", 'Kigali,Rwanda',
          'Akagera National Park'),
      Place('KCC', "assets/images/kp2.JPG", 'Kigali,Rwanda',
          'Virunga National Park'),
      Place('KCC', "assets/images/kp3.JPG", 'Kigali,Rwanda',
          'Amzon National Park'),
      Place('KCC', "assets/images/kp4.JPG", 'Kigali,Rwanda',
          'Kenyan National Park'),
      Place(
          'KCC', "assets/images/kp5.JPG", 'Kigali,Rwanda', 'DRC National Park'),
      Place(
          'KCC', "assets/images/kp5.JPG", 'Kigali,Rwanda', 'DRC National Park'),
      Place('KCC', "assets/images/af.JPEG", 'Kigali,Rwanda',
          'This is Serengeti National Park'),
      Place('KCC', "assets/images/kp.JPG", 'Kigali,Rwanda',
          'Akagera National Park'),
      Place('Virunga National Park', "assets/images/kp2.JPG", 'Kigali,Rwanda',
          'Virunga National Park'),
      Place('Amzon National Park', "assets/images/kp3.JPG", 'Kigali,Rwanda',
          'Amzon National Park'),
      Place('Kenyan National Park', "assets/images/kp4.JPG", 'Kigali,Rwanda',
          'Kenyan National Park'),
      Place('DRC National Park', "assets/images/kp5.JPG", 'Kigali,Rwanda',
          'DRC National Park'),
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
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xffB15C1E),
            ),
            onPressed: () {
              showSearch(context: context, delegate: Search(list));
            },
          ),
        ],
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 250,
                  child: DrawerHeader(
                    child: Container(
                        child: Stack(
                      children: [
                        Container(),
                        Container(
                          padding: EdgeInsets.only(
                            top: 100,
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
                      ],
                    )),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/cover1.png',
                          ),
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    children: <Widget>[
                      Text(widget.login,
                          style: TextStyle(
                              color: Color(0xffB15C1E), fontSize: 20)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 60, left: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Color(0xffB15C1E),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13.0),
                          child: Text('Edit My Profile'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Color(0xffB15C1E),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13.0),
                          child: Text('Notifications'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 0),
                  child: ListTile(
                    title: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.assignment_return,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupView(),
                                ));
                          },
                          color: Color(0xffB15C1E),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text('Log Out'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
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
                    child: Mybutton(
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
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(
                  mostVisitedCategories[selectedIndex].places.length, (index) {
                return Column(
                  children: [
                    Container(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpecificCountry(
                                place: Place(
                                    mostVisitedCategories[selectedIndex]
                                        .places[index]
                                        .name,
                                    mostVisitedCategories[selectedIndex]
                                        .places[index]
                                        .image,
                                    mostVisitedCategories[selectedIndex]
                                        .places[index]
                                        .location,
                                    mostVisitedCategories[selectedIndex]
                                        .places[index]
                                        .description),
                              ),
                            ));
                      },
                      child: Image.asset(
                        mostVisitedCategories[selectedIndex]
                            .places[index]
                            .image,
                        fit: BoxFit.cover,
                        width: 150.0,
                        height: 60.0,
                      ),
                    )),
                    SizedBox(
                      height: 6,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: ReadMoreText(
                          mostVisitedCategories[selectedIndex]
                              .places[index]
                              .description,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                );
              }),
            )
          ],
        ),
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
                        Image.asset(
                          item.image,
                          fit: BoxFit.cover,
                          width: 1000.0,
                          height: 500.0,
                        ),
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
          // Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => SpecificCountry(place: Place('This is Rwanda',
          //                      "assets/images/kc.jpg", 'Kigali',
          //                      'Ubwemwe Grand, Kigali Rwanda'),),));
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
    "Rwanda",
    "Burundi",
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(listExample.where(
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
