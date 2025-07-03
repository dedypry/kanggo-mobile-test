import 'package:get/get.dart';
import 'package:kanggo_test_mobile_apps/app/models/NewsModel.dart';
import 'package:kanggo_test_mobile_apps/configs/initDb.dart';

class FavoriteController extends GetxController {
  RxList<Articles> articles = <Articles>[].obs;

void getData() async {
  var db = await AppDatabase.database;

   final List<Map<String, dynamic>> maps = await db.query('articles');
   articles.assignAll(
      maps.map((map) => Articles.fromJson(map))
    );

    print(articles.length);
}

  @override
  void onInit() {
    super.onInit();
    print("INIT");
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
