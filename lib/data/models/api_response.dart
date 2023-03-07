// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blocstudy/data/models/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';
//TODO:PAra obtener el listado de articulos
@JsonSerializable()
class ApiResponse {
  late final String status;
  late final String? code;
  late final String? message;
  late final List<Article>? articles;

  ApiResponse();


  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
