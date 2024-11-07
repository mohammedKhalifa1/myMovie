import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/class/handling_data_view.dart';
import '../../../../widget/text_from_field.dart';
import '../../home_controller.dart';
import '../home_title_app_bare.dart';
import '../show_movie.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImo>(
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
                      controller.changeCount(i);

                      switch (i) {
                        case 0:
                          controller.functionMovie();
                          break;
                        case 1:
                          controller.functionTvSeries();
                        case 2:
                          controller.functionDocumentary();
                        case 3:
                          controller.functionSports();
                        default:
                      }
                    },
                    title: controller.titleAppBare[i],
                    active: i == controller.count ? true : false,
                  ),
              ],
            ),
          ),
          HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Center(
              child: ShowMovie(
                data: controller.movies,
              ),
            ),
          )
        ],
      ),
    );
  }
}
