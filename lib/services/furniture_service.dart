// import 'package:dio/dio.dart';
// import 'package:furniture/models/furniture_model.dart';
// Future<List<FurnitureModel>> getDataOfFurniture() async {
//   try {
//     Dio requestFurniture = Dio();
//     Response responseFurniture = await requestFurniture
//         .get('https://66f8d38d2a683ce973103919.mockapi.io/furniture');
//     List<FurnitureModel> listFurniture = [];
//     for (var i = 0; i < responseFurniture.data.length; i++) {
//       FurnitureModel furniture = FurnitureModel.furnitureFromMap(
//         responseFurniture.data[i],
//       );
//       listFurniture.add(furniture);
//     }
//     print(responseFurniture.data);
//     return listFurniture;
//   } catch (e) {
//     print(e);
//     return [];
//   }
// }

import 'package:dio/dio.dart';
import 'package:furniture/models/furniture_model.dart';

Future<List<FurnitureModel>> getDataOfFurniture() async {
  try {
    Dio requestFurniture = Dio();
    Response responseFurniture = await requestFurniture
        .get('https://66f8d38d2a683ce973103919.mockapi.io/furniture');

    List<FurnitureModel> listFurniture = [];

    for (var i = 0; i < responseFurniture.data.length; i++) {
      FurnitureModel furniture = FurnitureModel.furnitureFromMap(
        responseFurniture.data[i],
      );
      listFurniture.add(furniture);
    }
    // print(responseFurniture.data);
    return listFurniture;
  } catch (e) {
    print(e);
    return [];
  }
}
