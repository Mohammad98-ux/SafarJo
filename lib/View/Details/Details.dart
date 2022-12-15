import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:safar/lib_orgnaizer.dart';

class Details extends StatefulWidget {
  const Details(
      {Key? key,
      required this.name,
      required this.image,
      required this.details,
      required this.capital})
      : super(key: key);
  final String name;
  final String image;
  final String details;
  final String capital;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  color: Colors.grey.shade100,
                  child: Container(
                    child: Container(
                      height: 330,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      padding: EdgeInsets.all(22),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: widget.details,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ]),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(jordanRoute);
                      },
                      icon: Icon(
                        Icons.home_filled,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 290),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                          letterSpacing: 0.7,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.capital,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                              letterSpacing: 0.8,
                            ),
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          Container(
                            child: LikeButton(
                              size: 40,
                              circleColor: CircleColor(
                                  start: Color(0xff00ddff),
                                  end: Color(0xff0099cc)),
                              bubblesColor: BubblesColor(
                                dotPrimaryColor: Color(0xff33b5e5),
                                dotSecondaryColor: Color(0xff0099cc),
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isLiked ? Colors.red : Colors.blue,
                                  size: 39,
                                );
                              },
                              likeCount: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
