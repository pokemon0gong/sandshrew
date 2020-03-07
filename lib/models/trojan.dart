import 'package:json_annotation/json_annotation.dart';
import "ssl.dart";
import "tcp.dart";
part 'trojan.g.dart';

@JsonSerializable()
class Trojan {
    Trojan();

    String run_type;
    String local_addr;
    num local_port;
    String remote_addr;
    num remote_port;
    List password;
    num log_level;
    Ssl ssl;
    Tcp tcp;
    
    factory Trojan.fromJson(Map<String,dynamic> json) => _$TrojanFromJson(json);
    Map<String, dynamic> toJson() => _$TrojanToJson(this);
}
