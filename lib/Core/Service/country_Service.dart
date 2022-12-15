import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safar/lib_orgnaizer.dart';

class CountryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'Home';
  int statusCode = 200;
  String msg = '';

  Future<CountryList> getCountries() async {
    CountryList countryList = CountryList(countries: []);
    Map<String, dynamic> country = {};
    CountryModel countryModel;
    QuerySnapshot data =
    await _firestore.collection(collectionName).get();
    for (var item in data.docs) {
      country['id'] = item.get('id');
      country['name'] = item.get('name');
      country['imageUrl'] = item.get('imageUrl');
      country['capital']=item.get('capital');
      country['details']=item.get('details');
      countryModel = CountryModel.fromJson(country);
      countryList.countries.add(countryModel);
    }
    return countryList;
  }

  void handleErrors(ArgumentError error) {
    String errorCode = error.message;
    switch (errorCode) {
      case "ABORTED":
        {
          statusCode = 400;
          msg = "The operation was aborted";
        }
        break;
      case "ALREADY_EXISTS":
        {
          statusCode = 400;
          msg = "Some document that we attempted to create already exists.";
        }
        break;
      case "CANCELLED":
        {
          statusCode = 400;
          msg = "The operation was cancelled";
        }
        break;
      case "DATA_LOSS":
        {
          statusCode = 400;
          msg = "Unrecoverable data loss or corruption.";
        }
        break;
      case "PERMISSION_DENIED":
        {
          statusCode = 400;
          msg =
          "The caller does not have permission to execute the specified operation.";
        }
        break;
      default:
        {
          statusCode = 400;
          msg = error.message;
        }
        break;
    }
    log('msg : $msg');
  }
}