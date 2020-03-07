import 'package:json_annotation/json_annotation.dart';

part 'ssl.g.dart';

@JsonSerializable()
class Ssl {
    Ssl();

    bool verify;
    bool verify_hostname;
    String cert;
    String cipher;
    String cipher_tls13;
    String sni;
    List alpn;
    bool reuse_session;
    bool session_ticket;
    String curves;
    
    factory Ssl.fromJson(Map<String,dynamic> json) => _$SslFromJson(json);
    Map<String, dynamic> toJson() => _$SslToJson(this);
}
