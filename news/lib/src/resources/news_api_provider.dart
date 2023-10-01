import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

const String _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final response = await client.get(Uri.parse('$_root/topstories.json'));

    final ids = json.decode(response.body);

    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get(Uri.parse('$_root/item/$id.json'));

    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
