// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable(createToJson: false)
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Data extends Equatable {
  final int? id;
  final String? name;
  final int? year;
  // @JsonKey(name: 'renk')
  final String? color;
  // @JsonKey(fromJson: _fetchCustom)
  final String? pantoneValue;
  final String? price;
  final StatusCode? statusCode;

  const Data({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
    this.price,
    this.statusCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  @override
  List<Object?> get props => [id, name, price];
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue('500')
  weird
}
