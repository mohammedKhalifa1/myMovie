import 'package:flutter/material.dart';
import 'package:my_movie/core/class/status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? SizedBox(
            height: MediaQuery.sizeOf(context).height / 2,
            child: const Center(child: CircularProgressIndicator()))
        : statusRequest == StatusRequest.error
            ? const Center(
                child: Text(
                  "Error",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : widget;
  }
}
