// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/root_controller.dart';


// class RootView extends GetView<RootController> {
//   const RootView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Obx(
//       //   () => controller.screens[controller.selectedIndex],
//       // ),
//       bottomNavigationBar: Container(
//         height: 80,
//         decoration: const BoxDecoration(
//                 //  data: NavigationBarThemeData(indicatorColor: Colors.blue.shade100),

//           color: Color(0xFFF5F5F5),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10.0,
//               spreadRadius: 1,
//               offset: Offset(0.0, 0.75),
//             ),
//           ],
//         ),
//         child: Obx(
//           () => BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             selectedItemColor: Colors.black,
//             currentIndex: controller.selectedIndex,
//             onTap: controller.onTap,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: controller.selectedIndex == 0
//                         ? Colors.lightBlueAccent.withOpacity(0.2)
//                         : Colors.transparent,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(Icons.person_outline),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: controller.selectedIndex == 1
//                         ? Colors.lightBlueAccent.withOpacity(0.3)
//                         : Colors.transparent,
                        
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(Icons.add_circle_outline),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: controller.selectedIndex == 2
//                         ? Colors.lightBlueAccent.withOpacity(0.3)
//                         : Colors.transparent,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(Icons.home_outlined),
//                 ),
//                 label: '',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/root_controller.dart';

// class RootView extends GetView<RootController> {
//   const RootView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//         () => controller.screens[controller.selectedIndex],
//       ),
//       bottomNavigationBar: Container(
//         height: 80,
//         decoration: const BoxDecoration(
//           color: Color(0xFFF5F5F5),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10.0,
//               spreadRadius: 1,
//               offset: Offset(0.0, 0.75),
//             ),
//           ],
//         ),
//         child: Obx(
//           () => BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             selectedItemColor: Colors.black,
//             currentIndex: controller.selectedIndex,
//             onTap: controller.onTap,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: controller.selectedIndex == 0
//                         ? Colors.lightBlueAccent.withOpacity(0.2)
//                         : Colors.transparent,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.person_outline),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: controller.selectedIndex == 1
//                         ? Colors.lightBlueAccent.withOpacity(0.3)
//                         : Colors.transparent,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.add_circle_outline),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: controller.selectedIndex == 2
//                         ? Colors.lightBlueAccent.withOpacity(0.3)
//                         : Colors.transparent,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.home_outlined),
//                 ),
//                 label: '',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.screens[controller.selectedIndex],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 1,
              offset: Offset(0.0, 0.75),
            ),
          ],
        ),
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.black,
            currentIndex: controller.selectedIndex,
            onTap: controller.onTap,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex == 0
                        ? Colors.lightBlueAccent.withOpacity(0.2)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person_outline),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex == 1
                        ? Colors.lightBlueAccent.withOpacity(0.3)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add_circle_outline),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex == 2
                        ? Colors.lightBlueAccent.withOpacity(0.3)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.home_outlined),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}