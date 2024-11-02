import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movie/page/home/home_controller.dart';
import 'package:my_movie/page/home/widget/home_title_app_bare.dart';
import '../../widget/text_from_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImo());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeControllerImo>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  "Find Movies, Tv series \n and more",
                  style: GoogleFonts.cairo(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFromField(
                active: true,
                hint: " search ..",
                onTap: () {},
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.titleAppBare.length; i++)
                      TitleRowAppBare(
                        onTap: () {
                          controller.movie();
                          controller.changeCount(i);
                          switch (i) {
                            case 0:
                              break;
                            default:
                          }
                        },
                        title: controller.titleAppBare[i],
                        active: i == controller.count ? true : false,
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
