import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
//
// class InfiniteScrollController extends GetxController {
//   var items = <String>[].obs;
//   var isLoading = false.obs;
//   var hasError = false.obs;
//
//   ScrollController scrollController = ScrollController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadMoreItems();
//     scrollController.addListener(onScroll);
//   }
//
//   void onScroll() {
//     if (scrollController.position.pixels ==
//             scrollController.position.maxScrollExtent &&
//         !isLoading.value) {
//       loadMoreItems();
//     }
//   }
//
//   Future<void> loadMoreItems() async {
//     isLoading.value = true;
//     hasError.value = false;
//
//     try {
//
//       await Future.delayed(Duration(seconds: 2));
//       var newItems = [
//         'https://storage.googleapis.com/gweb-developer-goog-blog-assets/images_archive/original_images/AVvXsEiBvTaWkOFFihJud4ctimi-3DXWWjwU_x98aUPlba97hoBkHFASSExnr4U5JatHKG_PTDVeyD',
//         "https://mir-s3-cdn-cf.behance.net/projects/404/f049c2195601407.6610281c74a28.jpg",
//         "https://www.shutterstock.com/image-photo/defocused-background-keyboard-leptop-260nw-2225578507.jpg",
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvZwc8_YE0wb11CK3k1kO2Deh7ignAus8mQQ&s",
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYNlwdYOxxe5cUrKfKeGv37FQvEj5q6pfDmCcsM_RgYibeiIF7qGK8x3VHDq2pMNqCcRk&usqp=CAU",
//         "https://www.digitaltrends.com/wp-content/uploads/2021/11/macbook-pro-2021-16.jpg?fit=1500%2C1000&p=1",
//         "https://images.indianexpress.com/2019/06/good-morning-wishes_13-1.jpg",
//         "http://edugaon.com/images/edugaon.png",
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8fL2CmKMx_syIj2jdBaI8_oMi1M7MfwI-Pg&s",
//         "https://digitalfloats.com/wp-content/uploads/2023/10/ChatGPT.jpg",
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSahdrjg674kivOQHW5Kmoyc_OcqYLOR9tK9g&s",
//         "https://shutterstock.com/image-vector/ai-stars-icon-artificial-intelligence-600w-2351532151.jpg"
//
//       ];
//
//       items.addAll(newItems);
//       isLoading.value = false;
//     } catch (e) {
//       hasError.value = true;
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> refreshItems() async {
//
//     items.clear();
//     loadMoreItems();
//   }
// }

class InfiniteScrollController extends GetxController {
  var items = <String>[].obs;
  var isLoading = false.obs;
  var hasError = false.obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadMoreItems();
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent &&
        !isLoading.value) {
      loadMoreItems();
    }
  }

  Future<void> loadMoreItems() async {
    if (isLoading.value) return;

    isLoading.value = true;
    hasError.value = false;

    try {
      await Future.delayed(Duration(seconds: 2));
      var newItems = [
        'https://storage.googleapis.com/gweb-developer-goog-blog-assets/images_archive/original_images/AVvXsEiBvTaWkOFFihJud4ctimi-3DXWWjwU_x98aUPlba97hoBkHFASSExnr4U5JatHKG_PTDVeyD',
        "https://mir-s3-cdn-cf.behance.net/projects/404/f049c2195601407.6610281c74a28.jpg",
        "https://www.shutterstock.com/image-photo/defocused-background-keyboard-leptop-260nw-2225578507.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvZwc8_YE0wb11CK3k1kO2Deh7ignAus8mQQ&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYNlwdYOxxe5cUrKfKeGv37FQvEj5q6pfDmCcsM_RgYibeiIF7qGK8x3VHDq2pMNqCcRk&usqp=CAU",
        "https://www.digitaltrends.com/wp-content/uploads/2021/11/macbook-pro-2021-16.jpg?fit=1500%2C1000&p=1",
        "https://images.indianexpress.com/2019/06/good-morning-wishes_13-1.jpg",
        "http://edugaon.com/images/edugaon.png",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8fL2CmKMx_syIj2jdBaI8_oMi1M7MfwI-Pg&s",
        "https://digitalfloats.com/wp-content/uploads/2023/10/ChatGPT.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSahdrjg674kivOQHW5Kmoyc_OcqYLOR9tK9g&s",
        "https://shutterstock.com/image-vector/ai-stars-icon-artificial-intelligence-600w-2351532151.jpg"

      ];


      items.addAll(newItems);
      isLoading.value = false;
    } catch (e) {
      hasError.value = true;
      isLoading.value = false;
    }
  }

  Future<void> refreshItems() async {
    await Future.delayed(Duration(seconds: 2));

    items.clear();
    await loadMoreItems();
  }
}
