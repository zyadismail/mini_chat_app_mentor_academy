import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;
  final String uId;
  final String phoneNumber;
  String? about;
  String? image;
  String? createdAt;
  String? lastActivated;
  String? puchToken;
  bool? online;
  List? myUsers;

  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phoneNumber,
     this.about,
     this.image,
     this.createdAt,
     this.lastActivated,
     this.puchToken,
     this.online,
     this.myUsers,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      phoneNumber: user.phoneNumber ?? '',
      
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'] ?? "",
      phoneNumber: json['phoneNumber'],
      about: json["about"],
      image: json["image"],
      createdAt: json["created_at"],
      lastActivated: json["last_activated"],
      puchToken: json["puch_token"],
      online: json["online"],
      myUsers: json["my_users"],
    );
  }

  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'phoneNumber': phoneNumber,
      'about' : about,
      'image' : image,
      'created_at' : createdAt,
      'last_activated' : lastActivated,
      'puch_token' : puchToken,
      'online' : online,
      'my_users' : myUsers,
    };
  }
}
