import "./news_api_provider.dart";
import "./news_db_provider.dart";
import "../models/item_model.dart";

class Repository {
  // NewsDbProvider dbProvider = NewsDbProvider();
  // NewsApiProvider apiProvider = NewsApiProvider();
  List<Source> sources = <Source>[
    newsDbProvider,
    newsApiProvider,
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  Future<List<int>>? fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<ItemModel?> fetchItem(int id) async {
    // var item = await dbProvider.fetchItem(id);

    // if (item != null) return item;

    // item = await apiProvider.fetchItem(id);
    // dbProvider.addItem(item);

    // return item;

    late ItemModel? item;

    for (var source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        for (var cache in caches) {
          cache.addItem(item);
        }

        break;
      }
    }

    return item;
  }
}

abstract class Source {
  Future<List<int>>? fetchTopIds();
  Future<ItemModel?> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}
