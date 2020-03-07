// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ssl _$SslFromJson(Map<String, dynamic> json) {
  return Ssl()
    ..verify = json['verify'] as bool
    ..verify_hostname = json['verify_hostname'] as bool
    ..cert = json['cert'] as String
    ..cipher = json['cipher'] as String
    ..cipher_tls13 = json['cipher_tls13'] as String
    ..sni = json['sni'] as String
    ..alpn = json['alpn'] as List
    ..reuse_session = json['reuse_session'] as bool
    ..session_ticket = json['session_ticket'] as bool
    ..curves = json['curves'] as String;
}

Map<String, dynamic> _$SslToJson(Ssl instance) => <String, dynamic>{
      'verify': instance.verify,
      'verify_hostname': instance.verify_hostname,
      'cert': instance.cert,
      'cipher': instance.cipher,
      'cipher_tls13': instance.cipher_tls13,
      'sni': instance.sni,
      'alpn': instance.alpn,
      'reuse_session': instance.reuse_session,
      'session_ticket': instance.session_ticket,
      'curves': instance.curves
    };
