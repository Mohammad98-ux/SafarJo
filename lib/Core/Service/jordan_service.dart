import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safar/Core/Model/jordan_model.dart';

class JordanService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'jordan';
  int statusCode = 200;
  String msg = '';

  Future<JordanList> getCountries() async {
    JordanList jordanList = JordanList(jordan: []);
    Map<String, dynamic> jordan = {};
    JordanModel countryModel;
    QuerySnapshot data =
    await _firestore.collection(collectionName).get();
    for (var item in data.docs) {
      jordan['id'] = item.get('id');
      jordan['name'] = item.get('name');
      jordan['image'] = item.get('image');
      jordan['info']=item.get('info');
      jordan['king']=item.get('king');
      countryModel = JordanModel.fromJson(jordan);
      jordanList.jordan.add(countryModel);
    }
    return jordanList;
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