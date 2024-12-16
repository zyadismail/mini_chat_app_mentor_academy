// ignore_for_file: public_member_api_docs, sort_constructors_first

class GroupModel {
  String id;
  String name;
  String image;
  List members;
  List adminsId;
  String lastMessage;
  String lastMessageTime;
  String createdAt;

  GroupModel({
    required this.id,
    required this.name,
    required this.image,
    required this.members,
    required this.adminsId,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.createdAt,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json["id"] ?? "", // id : "value";
      name: json['name']?? "",
      image: json['image']?? "",
      adminsId: json['admins_id']?? [],
      createdAt: json["created_at"]?? "",
      members: json["members"] ?? [],
      lastMessage: json["last_message"] ?? "",
      lastMessageTime: json['last_message_time'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    // key w value
    return {
      'id': id,
      'created_at': createdAt,
      'name': name,
      'image': image,
      'admins_id': adminsId,
      'members' : members,
      'last_message' : lastMessage,
      'last_message_time' : lastMessageTime,
    };
  }

 
}
