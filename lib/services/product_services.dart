import 'package:http/http.dart' as http;
import 'package:kryia_people/constants/api.dart';
import 'package:kryia_people/models/product.dart';

class ProductServices {
  static var client = http.Client();

  static Future<List<ItemResponse>?> fetchTitleProduct() async {
    http.Response response = await client.get(Uri.parse(productAPI));
    if (response.statusCode == 200) {
      return itemResponseFromJson(response.body);
    } else {
      return null;
    }
  }
}
