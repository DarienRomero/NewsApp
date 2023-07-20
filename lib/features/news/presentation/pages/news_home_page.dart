import 'package:flutter/material.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/features/common/presentation/widgets/scaffold_wrapper.dart';
import 'package:news_app/features/news/presentation/widgets/new_preview_item.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({Key? key}) : super(key: key);

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  final news = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Aplicación de noticias'),
        leading: Container(),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: mqWidth(context, 5)
        ),
        child: SizedBox(
          height: mqHeigth(context, 100),
          child: ListView.builder(
            itemCount: news.length,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(
              top: mqHeigth(context, 3)
            ),
            itemBuilder: (context, index) {
              return const NewPreviewItem();
            },
          ),
        ),
      )
    );
  }
}