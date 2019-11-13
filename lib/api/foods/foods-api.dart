import 'foods.dart';
import 'package:http/http.dart' as http;

Future<List<Foods>> fetchFoods() async {
  String url = 'http://192.168.1.146/zomato/getfood.php';
  final res = await http.get(url);
  return foodsFromJson(res.body);
}
