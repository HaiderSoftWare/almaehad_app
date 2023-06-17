import 'package:get/get.dart';
import 'package:oxford/core/remote/api.dart';
import 'package:oxford/model/news.dart';

class NewsController extends GetxController {
  var news = NewsModel().obs;
  RxBool isLoading = false.obs;
  RxInt currentIndex = 0.obs;
  getNews() async {
    isLoading(true);
    try {
      final response = await Api.getNews();
      news.value = NewsModel.fromJson(response.data);
      isLoading(false);
      print('DATA =============== $news');
    } catch (e) {
      print('ERROR');
      isLoading(false);
    }
  }

  changeIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    getNews();
    super.onInit();
  }
}
