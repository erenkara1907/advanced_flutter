import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends INetworkModel {
  TokenModel({this.token});

  final String? token;

  @override
  TokenModel fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TokenModelToJson(this);
}
