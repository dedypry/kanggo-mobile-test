import 'package:get/get.dart';
import 'package:kanggo_test_mobile_apps/configs/api.dart';

class NewsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = API_HOST;
  }

  Future<Response> getNews(search, page) {
    String url = "${API_HOST}?q=${search}&from=2025-06-03&sortBy=publishedAt&pageSize=10&page=${page}&apiKey=${API_KEY}";
    print("URL $url");
    return get(url);
  }
}
