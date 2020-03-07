import 'package:json_annotation/json_annotation.dart';

part 'tcp.g.dart';

@JsonSerializable()
class Tcp {
    Tcp();

    bool no_delay;
    bool keep_alive;
    bool reuse_port;
    bool fast_open;
    num fast_open_qlen;
    
    factory Tcp.fromJson(Map<String,dynamic> json) => _$TcpFromJson(json);
    Map<String, dynamic> toJson() => _$TcpToJson(this);
}
