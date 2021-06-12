import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailController extends GetxController {
  var data = Get.arguments;
  final color = 0.obs;
  @override
  void onInit() {
    super.onInit();
    data = Get.arguments;
    parseColor(data!.avgColor!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void parseColor(String data) =>
      color.value = int.parse(data.replaceAll('#', '0xff'));

  void openUrl(String link) async => await canLaunch(link)
      ? await launch(link)
      : throw 'Could not launch $link';
}
