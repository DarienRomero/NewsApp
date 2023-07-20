import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/features/news/data/datasources/news_repository_remote_datasource.dart';
import 'package:news_app/features/news/data/models/article_model.dart';
import 'package:news_app/features/news/data/models/responses/news_list_response.dart';

class NewsRepositoryRemoteDataSourceImpl implements NewsRepositoryRemoteDataSource{

  final http.Client client;

  NewsRepositoryRemoteDataSourceImpl({required this.client});
  
  @override
  Future<List<ArticleModel>> getNewsList() async {

    try{
      final response = await client.get(
        Uri.parse('$baseUrl/everything?q=tesla&from=2023-06-20&sortBy=publishedAt&apiKey=$apiKey'),
        headers: {
          "Content-type": "application/json", 
          "Accept": "application/json",
        }
      );
      if(response.statusCode == 200){
        return newsListResponseFromMap(response.body).articles;
      }else{
        throw invalidDataFailureFromMap(response.body);
      }
    } on SocketException {
      throw NetworkFailure.exception;
    } on InvalidDataFailure{
      rethrow;
    }catch(e){
      /* await Sentry.captureMessage(
        "signInUser: EXCEPTION: " + e.toString() + " BODY: " + signInBodyToMap(body),
      ); */
      throw UnknownFailure.exception;
    }
  }
}