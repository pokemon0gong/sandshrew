// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tcp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tcp _$TcpFromJson(Map<String, dynamic> json) {
  return Tcp()
    ..no_delay = json['no_delay'] as bool
    ..keep_alive = json['keep_alive'] as bool
    ..reuse_port = json['reuse_port'] as bool
    ..fast_open = json['fast_open'] as bool
    ..fast_open_qlen = json['fast_open_qlen'] as num;
}

Map<String, dynamic> _$TcpToJson(Tcp instance) => <String, dynamic>{
      'no_delay': instance.no_delay,
      'keep_alive': instance.keep_alive,
      'reuse_port': instance.reuse_port,
      'fast_open': instance.fast_open,
      'fast_open_qlen': instance.fast_open_qlen
    };
