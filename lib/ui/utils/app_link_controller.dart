import 'dart:async';

import 'package:audioz/ui/player/player_controller.dart';
import 'package:get/get.dart';
import 'package:app_links/app_links.dart';

class AppLinksController extends GetxController {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void onInit() {
    initDeepLinks();
    super.onInit();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    //check inital link if app was in cold state(terminated)
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      await filterLinks(appLink);
    }

    //Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) async {
      await filterLinks(uri);
    });
  }

  Future<void> filterLinks(Uri uri) async {
    final playerController = Get.find<PlayerController>();
  }
}
