import 'package:flutter/material.dart';
import 'package:safar/View/Details/Details.dart';
import 'package:safar/lib_orgnaizer.dart';
import 'package:like_button/like_button.dart';

class item_Cart extends StatelessWidget {
  const item_Cart({Key? key, required this.model}) : super(key: key);
  final CountryModel model;

  final bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Card(
        elevation: 20,
        child: InkWell(
            onTap: () {

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => Details(
                        name: "${model.name}",
                        image: '${model.imageUrl}',
                        details: "${model.details}",
                        capital: '${model.capital}',
                      )),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  height: 210,
                  width: double.infinity,
                  child: Image.network(
                    model.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 43,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Text(
                                  model.name!,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Text(
                                  model.capital!,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: LikeButton(
                              size: 22,
                              circleColor: CircleColor(
                                  start: Color(0xff00ddff),
                                  end: Color(0xff0099cc)),
                              bubblesColor: BubblesColor(
                                dotPrimaryColor: Color(0xff33b5e5),
                                dotSecondaryColor: Color(0xff0099cc),
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  isFavorite
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  color: isLiked ? Colors.red : Colors.blue,
                                  size: 26,
                                );
                              },
                              likeCount: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
