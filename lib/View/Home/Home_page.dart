import 'package:flutter/material.dart';
import 'package:safar/lib_orgnaizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final List<String> imgList = [
  'https://www.urtrips.com/wp-content/uploads/2017/10/petra-jordan.jpg',
  'https://adminassets.devops.arabiaweather.com/sites/default/files/field/image/wadi-almujeb.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsHcBFaWVwYoeQG77r9mMDcxWxfL2h9x8_2QIAHRCUrseZsxkHo1eb8mLQ_iY-pDZIOSw&usqp=CAU',
  'https://travelerlibrary.com/wp-content/uploads/The-best-places-to-visit-in-Jordan.jpg',
  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/5e/e0/ed/caption.jpg?w=700&h=500&s=1&cx=654&cy=434&chk=v1_4d49a498021cb829843c',
  'https://iresizer.devops.arabiaweather.com/resize?url=https://adminassets.devops.arabiaweather.com/sites/default/files/field/image/aqaba1.jpg&size=850x478&force_jpg=1',
  'https://garaanews.com/upload/2016-04-11/181280_3_1460401551.jpg',
];

class _HomeState extends State<Home> {
  CountryService countryService = CountryService();
  UserModel user =UserModel();
  int l = 0;
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
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
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  showAlertDialog(BuildContext context) {  // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text("Log Out"),
      onPressed:  () {
        Navigator.of(context).pushNamed(loginRoute);
      },
    );  // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Log out"),
      content: Text(" Would You want to log_out?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );  // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(jordanRoute);
          }, icon: Icon(Icons.home),
          ),

        ],
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: (){
            showAlertDialog(context);
          },
        ),
        title: Text('Jordan'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: imageSliders,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 540,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: FutureBuilder(
                future: countryService.getCountries(),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  if (data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var result = data as CountryList;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: result.countries.length,
                    itemBuilder: (context, index) {
                      return item_Cart(
                        model: result.countries[index],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
