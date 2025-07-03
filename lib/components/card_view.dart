import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanggo_test_mobile_apps/app/models/NewsModel.dart';
import 'package:kanggo_test_mobile_apps/app/modules/home/controllers/home_controller.dart';
import 'package:kanggo_test_mobile_apps/configs/api.dart';
import 'package:kanggo_test_mobile_apps/configs/initDb.dart';

class CardView extends StatefulWidget {
  final Articles item;
  const CardView({super.key, required this.item});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    checkFavorite();
  }

  void checkFavorite() async {
    var db = await AppDatabase.database;
    final result = await db.query(
      'articles',
      where: 'title = ?',
      whereArgs: [widget.item.title],
      limit: 1,
    );

    if (result.isNotEmpty) {
      setState(() {
        isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(
              imageUrl: widget.item.urlToImage ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  CircularProgressIndicator(strokeWidth: 2),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image, size: 50, color: Colors.grey),
            ),
          ListTile(
            title: Text(
              widget.item.title ?? 'No title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              children: [
                SizedBox(height: 10,),
                Text(widget.item.description!),
                SizedBox(height: 10,),
                Text(widget.item.content!),
                SizedBox(height: 10,),
                Text('Author :'),
                Text(widget.item.author ?? 'No author')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(formatDate(widget.item.publishedAt!)),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    controller.saveFavorite(widget.item, isFavorite);
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
