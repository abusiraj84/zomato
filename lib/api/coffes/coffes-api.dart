import 'coffes.dart';
import 'package:http/http.dart' as http;

Future<List<Coffees>> fetchCoffees() async {
  String url = 'http://192.168.1.146/zomato/getcoffe.php';
  final res = await http.get(url);
  return coffeesFromJson(res.body);
}
