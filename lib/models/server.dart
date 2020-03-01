import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart';

@JsonSerializable()
class Server {
    Server();

    String name;
    String address;
    num port;
    String password;
    
    factory Server.fromJson(Map<String,dynamic> json) => _$ServerFromJson(json);
    Map<String, dynamic> toJson() => _$ServerToJson(this);
}
