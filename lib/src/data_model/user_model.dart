import 'package:flutter/material.dart';

class User {
  User(
      {this.id,
      this.name,
      this.email,
      this.avatar,
      this.address,
      this.phoneNumber,
      this.theme,
      this.createdAt,
      this.updatedAt,
      this.facebook,
      this.header,
      this.info,
      this.linkedIn,
      this.mapLocation,
      this.twitter,
      this.website,
      this.instagram,
      this.youTube,
      this.github,
      this.androidAppLink,
      this.color,
      this.categories,
      this.deepLink,
      this.iosAppLink,
      this.views});

  String? color;
  String? id;
  String? name;
  String? header;
  String? theme;
  String? email;
  String? avatar;
  String? info;
  String? website;
  String? phoneNumber;
  String? facebook;
  String? twitter;
  String? linkedIn;
  String? youTube;
  String? instagram;
  String? github;
  String? address;
  String? iosAppLink;
  String? androidAppLink;
  String? mapLocation;
  String? deepLink;
  String? views;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? categories;

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        header = map['header'],
        theme = map['theme'],
        email = map['email'],
        avatar = map['avatar'],
        info = map['info'],
        website = map['website'],
        phoneNumber = map['phoneNumber'],
        facebook = map['facebook'],
        twitter = map['twitter'],
        linkedIn = map['linkedIn'],
        youTube = map['youTube'],
        instagram = map['instagram'],
        github = map['github'],
        address = map['address'],
        mapLocation = map['mapLocation'],
        createdAt = map['createdAt'],
        updatedAt = map['updatedAt'],
        iosAppLink = map['iosAppLink'],
        androidAppLink = map['androidAppLink'],
        deepLink = map['deepLink'],
        color = map['color'],
        views = map['views'],
        categories = map['categories'];

  // User.fromSnapshot(DocumentSnapshot snapshot) {
  //   id = snapshot.documentID;
  //   name = snapshot.data['name'];
  // }
  User.toMap(User user)
      : id = user.id,
        name = user.name,
        header = user.header,
        theme = user.theme,
        email = user.email,
        avatar = user.avatar,
        info = user.info,
        website = user.website,
        phoneNumber = user.phoneNumber,
        facebook = user.facebook,
        twitter = user.twitter,
        linkedIn = user.linkedIn,
        youTube = user.youTube,
        instagram = user.instagram,
        github = user.github,
        address = user.address,
        mapLocation = user.mapLocation,
        createdAt = user.createdAt,
        updatedAt = user.updatedAt,
        categories = user.categories,
        iosAppLink = user.iosAppLink,
        androidAppLink = user.androidAppLink,
        views = user.views,
        deepLink = user.deepLink;
}
