import 'package:flutter/material.dart';

class TitleRowAppBare extends StatelessWidget {
  const TitleRowAppBare({
    super.key,
    required this.title,
    required this.onTap,
    this.active,
  });

  final String title;
  final VoidCallback onTap;
  final bool? active;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Text(
              title,
              style: TextStyle(
                  color:
                      active == true ? const Color(0xffff5638) : Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 30,
            height: 2,
            color: active == true ? const Color(0xffff5638) : null,
          )
        ],
      ),
    );
  }
}
