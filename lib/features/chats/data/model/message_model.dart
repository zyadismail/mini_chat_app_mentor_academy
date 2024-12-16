class MessageModel {
  String? id;
  String? toId;
  String? fromId;
  String? message;
  String? type;
  String? createdAt;
  String? read;

  MessageModel({
    required this.id,
    required this.toId,
    required this.fromId,
    required this.message,
    required this.type,
    required this.createdAt,
    required this.read,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] ?? "",
      toId: json['to_id'],
      fromId: json['from_id'],
      message: json['message'],
      type: json['type'],
      createdAt: json['created_at'],
      read: json['read'],
    );
  }


    Map<String, dynamic> toJson() { // key w value
    return {
      'id' : id,
      'to_id' : toId,
      'from_id' : fromId,
      'message' : message,
      'type' : type,
      'created_at' : createdAt,
      'read' : read,
    };
  }
}
