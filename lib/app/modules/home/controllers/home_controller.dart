import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kanggo_test_mobile_apps/app/models/NewsModel.dart';
import 'package:kanggo_test_mobile_apps/app/modules/home/providers/news_provider.dart';
import 'package:kanggo_test_mobile_apps/configs/initDb.dart';

class HomeController extends GetxController {
  final NewsProvider _provider = NewsProvider();
  TextEditingController searchController = TextEditingController();

  void saveFavorite(Articles item, bool isFavorite) async {
    try {
      final DB = await AppDatabase.database;
      if (isFavorite) {
        print("MASUK");
        await DB.insert("articles", {
          "source_id": item.source?.id,
          "source_name": item.source?.name,
          "author": item.author,
          "title": item.title,
          "description": item.description,
          "url": item.url,
          "urlToImage": item.urlToImage,
          "publishedAt": item.publishedAt,
          "content": item.content,
        });
      }else{
        await DB.delete(
          "articles",
          where: "title = ?",
          whereArgs: [item.title],
        );
      }
      print("SUCCESS");
    } catch (e) {
      print("ERROR ${e.toString()}");
      Get.snackbar("ERROR", e.toString());
    }
  }

  late final pagingController = PagingController<int, Articles>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => fetchPagedNews(
      search: searchController.text.trim().isEmpty
          ? "aa"
          : searchController.text.trim(),
      page: pageKey,
      more: true,
    ),
  );

  Future<List<Articles>> fetchPagedNews({
    String search = 'a',
    int page = 1,
    more = false,
  }) async {
    try {
      final response = await _provider.getNews(search, page);

      if (response.statusCode == 200 && response.body != null) {
        final news = NewsModel.fromJson(response.body as Map<String, dynamic>);
        return news.articles ?? [];
      } else {
        Get.snackbar("Error", "Failed to load news");
        return [];
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return [];
    }
  }

  void search() {
    pagingController.refresh();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print("READY");
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }
}
