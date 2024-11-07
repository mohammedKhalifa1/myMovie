import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

// class BottomNavigationBarWidget extends StatelessWidget {
//   final List<P> data;
//   const BottomNavigationBarWidget({
//     super.key,
//     required this.data,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       decoration: const BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           InkWell(
//             onTap: () {},
//             child: Column(
//               children: [
//                 Text(data[0].title),
//                 Icon(data[0].iconData),
//               ],
//             ),
//           ),
//           InkWell(
//             onTap: () {},
//             child: Column(
//               children: [
//                 Text(data[1].title),
//                 Icon(data[1].iconData),
//               ],
//             ),
//           ),
//           InkWell(
//             onTap: () {},
//             child: Column(
//               children: [
//                 Text(data[2].title),
//                 Icon(data[2].iconData),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class AbbPareTow extends StatelessWidget {
  final int i;
  final List<P> data;

  const AbbPareTow({
    super.key,
    required this.data,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    HomeControllerImo controller2 = Get.put(HomeControllerImo());
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width / 3,
          child: InkWell(
            onTap: () {
              controller2.changeIndexAppBare(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  data[index].title,
                  style: TextStyle(
                      color:
                          index == i ? const Color(0xffff5638) : Colors.white,
                      fontSize: index == i ? 15 : 10),
                ),
                Icon(
                  data[index].iconData,
                  size: index == i ? 25 : 20,
                  color: index == i ? const Color(0xffff5638) : Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
