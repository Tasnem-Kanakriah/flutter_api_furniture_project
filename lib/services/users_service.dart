import 'package:dio/dio.dart';
import 'package:furniture/models/users_model.dart';

Future<List<UsersModel>> getDataOfUser() async {
  Dio requestUsers = Dio();
  Response responseUsers = await requestUsers
      .get('https://66f8d38d2a683ce973103919.mockapi.io/users');

  List<UsersModel> users = [];

  for (var i = 0; i < responseUsers.data.length; i++) {
    UsersModel user = UsersModel.userFromMap(
      responseUsers.data[i],
    );
    users.add(user);
  }
  return users;
}
