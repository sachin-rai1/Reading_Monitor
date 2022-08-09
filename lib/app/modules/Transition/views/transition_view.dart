import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Navigation/navigationDrawer.dart';
import '../../home/views/home_view.dart';
import '../controllers/transition_controller.dart';
class TransitionView extends GetView<TransitionController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: (const BoxDecoration(
          image: DecorationImage(
            repeat: ImageRepeat.repeat,
            image: AssetImage('assets/images/Bg2.png'),
            fit: BoxFit.cover,
          ),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
           drawer: NavigationDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Get.toNamed("SwitchUser");
                },
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/user1.png',
                    height: 41.19,
                    width: 41.19,
                  ),
                ),
              ),
            ],
            elevation: 0,
            leading: Builder(builder: (context) {
              return IconButton(
                iconSize: 41.19,
                icon: const Icon(Icons.menu_outlined),
                color: Colors.green,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            }),
          ),
          body: Stack(children: [
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.to(HomeView());
                },
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/RmLogo.png',
                    height: 64,
                    width: 302,
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}

