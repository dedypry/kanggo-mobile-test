import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kanggo_test_mobile_apps/components/card_view.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: const Text('My Favorite'), centerTitle: true),
        body: controller.articles.length > 0
            ? ListView.builder(
                itemCount: controller.articles.length,
                itemBuilder: (context, index) {
                  final article = controller.articles[index];

                  return CardView(item: article);
                },
              )
            : Center(child: Text("No Data Favorite")),
      );
    });
  }
}
