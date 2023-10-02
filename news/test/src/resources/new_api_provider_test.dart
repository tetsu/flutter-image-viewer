// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:news/src/resources/news_api_provider.dart';

// import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart';
// import 'package:http/testing.dart';

void main() {
  test('FetchTopIds return a list of ids.', () async {
    // setup of test case
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    // expectation
    expect(ids, [1, 2, 3, 4]);
  });

  test('FetchItem return an item model.', () async {
    // setup of test case
    final newsApi = NewsApiProvider();

    newsApi.client = MockClient((request) async {
      final jsonMap = {
        'id': 123,
        'deleted': false,
        'type': 'test',
        'by': 'Me',
        'time': 1232,
        'text': 'hi',
        'dead': false,
        'parent': 1,
        'kids': [],
        'url': 'http://test.com/',
        'score': 1,
        'title': 'Title',
        'descendants': 0
      };
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(999);

    // expectation
    expect(item.id, 123);
  });
}
