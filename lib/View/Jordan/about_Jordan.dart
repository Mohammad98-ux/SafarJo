import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:safar/Core/Model/jordan_model.dart';
import 'package:safar/Core/Service/jordan_service.dart';
import 'package:safar/View/Jordan/widget/item_jordan.dart';
import 'package:safar/lib_orgnaizer.dart';

class Jordan extends StatefulWidget {
  const Jordan({Key? key}) : super(key: key);

  @override
  State<Jordan> createState() => _JordanState();
}

final List<String> imgList = [
  'https://www.jordan-road.com/wp-content/uploads/2018/04/citadel.jpg',
  'https://www.planetware.com/wpimages/2020/03/jordan-top-attractions-wadi-rum.jpg',
  'https://vid.alarabiya.net/images/2014/06/29/3425b8a4-f82e-42ae-9e02-0012bc162f4b/3425b8a4-f82e-42ae-9e02-0012bc162f4b_16x9_600x338.jpg',
  'https://universes.art/fileadmin/_migrated/gridelement_uploads/00-Kerak_BW-2000-750_01.jpg',
  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/5e/e0/ed/caption.jpg?w=700&h=500&s=1&cx=654&cy=434&chk=v1_4d49a498021cb829843c',
  'https://iresizer.devops.arabiaweather.com/resize?url=https://adminassets.devops.arabiaweather.com/sites/default/files/field/image/aqaba1.jpg&size=850x478&force_jpg=1',
  'https://garaanews.com/upload/2016-04-11/181280_3_1460401551.jpg',
];

class _JordanState extends State<Jordan> {
  JordanService jordanService=JordanService();
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
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: (){
            showAlertDialog(context);
          },
        ),
        backgroundColor: Colors.black,
        title: Text(
          'Jordan',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.vertical,
                  autoPlay: true,
                ),
                items: imageSliders,
              )),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 540,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: FutureBuilder(
                  future: jordanService.getCountries(),
                  builder: (context, snapshot) {
                    var data = snapshot.data;
                    if (data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var result = data as JordanList;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2
                      ),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: result.jordan.length,
                      itemBuilder: (context, index) {
                        return ItemJordan(
                          model: result.jordan[index],
                        );
                      },
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
