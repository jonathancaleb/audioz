import 'package:audioz/ui/player/player.dart';
import 'package:audioz/ui/player/player_controller.dart';
import 'package:audioz/ui/navigator.dart';
import 'package:audioz/ui/widgets/mini_player_progress_bar.dart';
import 'package:audioz/ui/widgets/sliding_up_panel.dart';
import 'package:audioz/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  const Root({super.key});
  static const routeName = '/appHome';

  @override
  Widget build(BuildContext context) {
    printINFO("Home");
    var safePadding = MediaQuery.of(context).padding.bottom;
    final PlayerController playerController = Get.find<PlayerController>();
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: true,
      //todo: make modification
      onPopInvoked: (didPop) async {
        if (playerController.playerPanelController.isPanelOpen) {
          playerController.playerPanelController.close();
          //return false;
        } else {
          if (Get.nestedKey(ScreenNavigationSetup.id)!.currentState!.canPop()) {
            Get.nestedKey(ScreenNavigationSetup.id)!.currentState!.pop();
            // return false;
          }
          //todo: fix this error on return "The return type 'bool' isn't a 'Future<void>', as required by the closure's "
          //commented it out for now
          //return true;
        }
      },
      child: Scaffold(
        key: playerController.rootScaffoldkey,
        body: Obx(() => SlidingUpPanel(
              onPanelSlide: playerController.panellistener,
              controller: playerController.playerPanelController,
              minHeight: playerController.playerPanelMinHeight.value,
              maxHeight: size.height,
              //todo: work on player module
              panel: const Player(),
              body: const ScreenNavigation(),
              header: Obx(() {
                return Visibility(
                    visible: playerController.isPlayerpanelTopVisible.value,
                    child: Opacity(
                      opacity: playerController.playerPaneOpacity.value,
                      child: Container(
                        height: 75 + safePadding,
                        width: size.width,
                        color:
                            Theme.of(context).bottomSheetTheme.backgroundColor,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                height: 3,
                                color: Theme.of(context)
                                    .progressIndicatorTheme
                                    .color,
                                child: MiniPlayerProgressBar(
                                    progressBarStatus: playerController
                                        .progressBarStatus.value,
                                    progressBarColor: Theme.of(context)
                                            .progressIndicatorTheme
                                            .linearTrackColor ??
                                        Colors.white),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 17.0, vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    playerController.currentSong.value != null ? Imag
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
              }),
            )),
      ),
    );
  }
}
