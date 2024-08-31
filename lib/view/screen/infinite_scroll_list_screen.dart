import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../controller/getx_controller.dart';

class InfiniteScrollScreen extends StatefulWidget {
  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final InfiniteScrollController controller = Get.put(InfiniteScrollController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Infinite Scroll')),
      ),
      body: Obx(() => RefreshIndicator(
        onRefresh: controller.refreshItems,
        child: ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.items.length + 1,
          itemBuilder: (context, index) {
            if (index == controller.items.length) {
              return loaderImage(controller.isLoading.value, controller.hasError.value);
            }
            return imageItem(controller.items[index]);
          },
        ),
      )),
    );
  }

  Widget imageItem(String imageUrl) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17.0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const Center(
            child: CupertinoActivityIndicator(),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error, color: Colors.red),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget loaderImage(bool isLoading, bool hasError) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Center(child: CupertinoActivityIndicator()),
      );
    } else if (hasError) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Center(child: Text('Error loading data', style: TextStyle(color: Colors.red))),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
