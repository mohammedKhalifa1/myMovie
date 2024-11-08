import 'package:flutter/material.dart';
import 'package:my_movie/core/class/route_name.dart';
import 'package:my_movie/page/home/home_page.dart';
import 'package:my_movie/page/items/items.dart';

Map<String, Widget Function(BuildContext)> routes = {
  RouteName.home: (context) => const HomePage(),
  RouteName.items: (context) => const Items(),
};
