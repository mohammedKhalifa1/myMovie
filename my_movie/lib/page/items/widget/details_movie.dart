import 'package:flutter/material.dart';

import '../items_controller.dart';

class DetailsMovie extends StatelessWidget {
  final ItemsControllerImp controller;
  const DetailsMovie({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            controller.omdModel!.title!,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
          ),
          height: 20,
          child: Row(
            children: <Widget>[
              Text(
                "imdbID :  ",
                style: TextStyle(
                    fontSize: 15, color: Colors.white.withOpacity(0.6)),
              ),
              Text(
                controller.omdModel!.imdbID!,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Divider(
            color: Colors.white.withOpacity(0.3),
            thickness: 0.6,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  "Release Data",
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    controller.omdModel!.year!,
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Genre",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  decoration: BoxDecoration(
                      color: const Color(0xff201f27),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    controller.omdModel!.type!,
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                )
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Divider(
            color: Colors.white.withOpacity(0.3),
            thickness: 0.6,
          ),
        ),
      ],
    );
  }
}
