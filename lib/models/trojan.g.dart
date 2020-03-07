// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trojan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trojan _$TrojanFromJson(Map<String, dynamic> json) {
  return Trojan()
    ..run_type = json['run_type'] as String
    ..local_addr = json['local_addr'] as String
    ..local_port = json['local_port'] as num
    ..remote_addr = json['remote_addr'] as String
    ..remote_port = json['remote_port'] as num
    ..password = json['password'] as List
    ..log_level = json['log_level'] as num
    ..ssl = json['ssl'] == null
        ? null
        : Ssl.fromJson(json['ssl'] as Map<String, dynamic>)
    ..tcp = json['tcp'] == null
        ? null
        : Tcp.fromJson(json['tcp'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TrojanToJson(Trojan instance) => <String, dynamic>{
      'run_type': instance.run_type,
      'local_addr': instance.local_addr,
      'local_port': instance.local_port,
      'remote_addr': instance.remote_addr,
      'remote_port': instance.remote_port,
      'password': instance.password,
      'log_level': instance.log_level,
      'ssl': instance.ssl,
      'tcp': instance.tcp
    };
