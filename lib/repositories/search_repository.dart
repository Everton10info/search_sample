import '../models/users_model.dart';
import '../resources/appHttpClient/http_client_interface.dart';

class SearchRepository {
  final AppHttpClient clienteHttp;

  SearchRepository(this.clienteHttp);

  Future<List<User>> getLis() async {
    try {
      List resultList = await clienteHttp.getList();

      return resultList.map((user) => User.fromJson(user)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
