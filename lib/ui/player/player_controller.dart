import 'package:audio_service/audio_service.dart';
import 'package:audioz/models/durationstate.dart';
import 'package:audioz/ui/widgets/sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {
  final playerPaneOpacity = (1.0).obs;
  final isPlayerpanelTopVisible = true.obs;
  final isPlayerPaneDraggable = true.obs;
  final playerPanelMinHeight = 0.0.obs;

  final progressBarStatus = ProgressBarState(
          buffered: Duration.zero, current: Duration.zero, total: Duration.zero)
      .obs;

  final currentSong = Rxn<MediaItem>();

  PanelController playerPanelController = PanelController();
  final GlobalKey<ScaffoldState> rootScaffoldkey = GlobalKey<ScaffoldState>();

  void panellistener(double x) {
    if (x >= 0 && x <= 0.2) {
      playerPaneOpacity.value = 1 - (x * 5);
      isPlayerpanelTopVisible.value = true;
    }
    if (x > 0.2) {
      isPlayerpanelTopVisible.value = false;
    }
    if (x > 0) {
      isPlayerPaneDraggable.value = false;
    } else {
      isPlayerPaneDraggable.value = true;
    }
  }
}
