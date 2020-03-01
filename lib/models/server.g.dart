// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Server _$ServerFromJson(Map<String, dynamic> json) {
  return Server()
    ..name = json['name'] as String
    ..address = json['address'] as String
    ..port = json['port'] as num
    ..password = json['password'] as String;
}

Map<String, dynamic> _$ServerToJson(Server instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'port': instance.port,
      'password': instance.password
    };
