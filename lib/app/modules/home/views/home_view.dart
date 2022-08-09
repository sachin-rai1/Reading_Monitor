import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../Navigation/navigationDrawer.dart';
import '../controllers/home_controller.dart';

 List<Choice> choices = <Choice>[
  Choice(title: 'Utility', image: "assets/Icons/electric_bolt.png" , index: 1),
  Choice(title: 'Steam Boiler', image: "assets/Icons/steam.png", index: 2),
  Choice(title: 'Thermopack', image: "assets/Icons/thermpack.png" , index: 3),
  Choice(title: 'Machines', image: "assets/Icons/machines.png", index: 4),
  Choice(title: 'Water Quality', image: "assets/Icons/Quality.png" , index: 5),
  Choice(title: 'Supply Pump\n& Unit', image: "assets/Icons/pump.png", index: 6),
  Choice(title: 'GEB', image: "assets/Icons/geb.png", index: 7),
  Choice(title: 'Mano Meter', image: "assets/Icons/mano_meter.png", index: 8),
  Choice(title: 'Flue Gas', image: "assets/Icons/temp.png", index: 9),
  Choice(title: 'Misc.', image: "assets/Icons/misc.png", index: 10),
];

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Container(
      decoration: (const BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('assets/images/bg3.png'),
          fit: BoxFit.cover,
        ),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
         drawer: NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: ClipRRect(
            child: Image.asset(
              'assets/images/RmLogo.png',
              height: 33,
              width: 124,
            ),
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          elevation: 0,
          leading: Builder(builder: (context) {
            return IconButton(
              iconSize: 41.19,
              icon: const Icon(Icons.menu),
              color: Colors.green,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }),
        ),
        body: Column(
          children: [
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF716259),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        controller.chooseDate();
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month_sharp,
                              color: Colors.white),
                          const SizedBox(
                            width: 10,
                          ),
                          Obx(()=>
                             Text(
                               DateFormat("dd-MM-yyyy")
                                   .format(controller.selectedDate.value)
                                   .toString(),
                               style:TextStyle(fontSize:16 , color: Colors.white , fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.arrow_drop_down_circle_outlined,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 3,
                    children: List.generate(10, (index) {
                      return Center(child: SelectCard(choice: choices[index]));
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Choice {
   Choice({required this.title, required this.image , required this.index});
  int index;
  final String title;
  final String image;
}

class SelectCard extends StatelessWidget {
   SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 3,
      child: GestureDetector(
        onTap: () {

        },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
            ),
            elevation: 10,
            color: const Color(0xFFF6F6F6),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    choice.image,
                    height: 70,
                    width: 25,
                  ),
                  // Icon(choice.icon, size: 26, color: const Color(0xFF716259)),
                  Text(choice.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: Color(0xFF6EB7A1))),
                ])),
      ),
    );
  }
}
