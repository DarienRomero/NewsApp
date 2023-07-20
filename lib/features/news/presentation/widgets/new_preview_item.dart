import 'package:flutter/material.dart';
import 'package:news_app/core/navigation.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/features/common/presentation/widgets/general_image.dart';
import 'package:news_app/features/common/presentation/widgets/h_spacing.dart';
import 'package:news_app/features/news/presentation/pages/new_details_page.dart';

class NewPreviewItem extends StatelessWidget {
  const NewPreviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, cupertinoNavigationRoute(context, const NewDetailsPage()));
      },
      child: Container(
        width: mqWidth(context, 90),
        margin: EdgeInsets.only(
          bottom: mqHeigth(context, 3)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralImage(
              width: mqWidth(context, 20),
              height: mqWidth(context, 20),
              url: "",
              fromLocal: false,
              borderRadius: 10,
              fit: BoxFit.cover,
            ),
            const HSpacing(5),
            SizedBox(
              height: mqWidth(context, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mqWidth(context, 65),
                    child: const Text(
                      "6 Houses destroyed  in massive fire", 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text("Rossmery | 10/05/23", style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}