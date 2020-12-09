import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:readmore/readmore.dart';
import 'package:visistafri/models/mostVisited.models.dart';
import 'package:visistafri/models/place.models.dart';
import 'package:visistafri/repostory/data.dart';
import 'package:visistafri/repostory/repository.dart';
import 'package:visistafri/views/beforeBook.view.dart';

class SpecificCountry extends StatefulWidget {
  final Place place;

  const SpecificCountry({Key key, @required this.place}) : super(key: key);
  @override
  _SpecificCountryState createState() => _SpecificCountryState();
}

class _SpecificCountryState extends State<SpecificCountry> {
  List<String> kWords;
  int selectedIndex = 0;

  String selectedCategory = "Buildings";
  MostVisted mostVisited;

  @override
  void initState() {
    mostVisited = Repositroy().getItemsByCountryAndCategory(
      widget.place.location,
      selectedCategory,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffB15C1E)),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Visit Africa',
          style: TextStyle(
            color: Color(0xffB15C1E),
          ),
        ),
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
                  height: 364,
                  child: DrawerHeader(
                    child: Container(
                        child: Stack(
                      children: [
                        Container(
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/Group 3.png')),
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
                          child: Text('Rita@gmail.com',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Container(
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(widget.place.image),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    top: 120.0,
                  ),
                  child: Text(
                    widget.place.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 16,
                left: 16,
              ),
              child: Text(
                'Tourist Attractive Places In ${widget.place.location}',
                style: TextStyle(
                  color: Color(0xffB15C1E),
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 37.0,
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
                          mostVisited =
                              Repositroy().getItemsByCountryAndCategory(
                            widget.place.location,
                            mostVisitedCategories[index].name,
                          );
                          selectedIndex = index;
                          mostVisited =
                              Repositroy().getItemsByCountryAndCategory(
                            widget.place.location,
                            mostVisitedCategories[index].name,
                          );
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
            Container(
              child: Container(
                child: GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children:
                      List.generate(mostVisited?.places?.length ?? 0, (index) {
                    return Column(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => book()));
                            },
                            child: Image.asset(
                              mostVisited.places[index].image,
                              fit: BoxFit.cover,
                              height: 60.0,
                              width: 150.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: ReadMoreText(
                            mostVisited.places[index].name,
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            mostVisited.places[index].location,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
