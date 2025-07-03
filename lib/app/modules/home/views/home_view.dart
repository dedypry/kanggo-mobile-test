import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kanggo_test_mobile_apps/app/models/NewsModel.dart';
import 'package:kanggo_test_mobile_apps/components/card_view.dart';
import 'package:kanggo_test_mobile_apps/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.searchController,
                decoration: const InputDecoration(
                  hintText: 'Search news...',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: controller.search,
            ),
          ],
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(Routes.FAVORITE),
        label: Text(
          "My Favorit",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        icon: Icon(Icons.favorite, color: Colors.white),
        backgroundColor: Colors.red,
      ),
      body: PagingListener(
        controller: controller.pagingController,
        builder: (context, state, fetchNextPage) =>
            PagedListView<int, Articles>(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) => CardView(item: item),
              ),
            ),
      ),
    );
  }
}
