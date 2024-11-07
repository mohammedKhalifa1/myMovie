import 'package:flutter/material.dart';
import '../../../core/model/mod_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowMovie extends StatelessWidget {
  final List<OmdModel> data;
  const ShowMovie({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 1.8,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: CachedNetworkImage(
                      imageUrl: data[index].poster!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: Text(
                          "Loading ..",
                          style: TextStyle(color: Colors.white),
                        ),
                      ), //CircularProgressIndicator()
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error_outline,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    data[index].title!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
