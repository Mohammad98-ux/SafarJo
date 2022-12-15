import 'package:flutter/material.dart';
import 'package:safar/Core/Model/jordan_model.dart';
import 'package:safar/View/Jordan/King.dart';
import 'package:safar/View/Jordan/info.dart';
import 'package:safar/lib_orgnaizer.dart';


class ItemJordan extends StatelessWidget {
  const ItemJordan({Key? key, required this.model}) : super(key: key);
  final JordanModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            switch(model.name){
              case 'Tourist areas':
              {
                Navigator.of(context).pushNamed(countryRoute);
              }
              break;
              case 'more info for Jordan':{
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => infoJordan(
                      name: "${model.info}",
                      image: '${model.image}',
                    )),
                  ),
                );
              }
              break;
              case 'King:Abdullah II bin Al-Hussein':{
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => King(
                      name: "${model.king}",
                      image: '${model.image}',
                    )),
                  ),
                );
              }
            }

          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 140,
                child: Image.network(model.image!,fit: BoxFit.fill,),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text(model.name!),
              ),
            ],
          ),
        ),
    );
  }
}
