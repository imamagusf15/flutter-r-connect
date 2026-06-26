import 'package:flutter_rconnect/app/data/models/branch_model.dart';

class User {
  String? email;
  String? username;
  String? name;
  String? npp;
  String? phone;
  String? branchId;
  String? branchCode;
  String? branchName;
  int? roleId;
  String? roleHris;
  String? image;
  List<Branch>? branchList;

  User({
    this.email,
    this.username,
    this.name,
    this.npp,
    this.phone,
    this.branchId,
    this.branchCode,
    this.branchName,
    this.roleId,
    this.roleHris,
    this.image,
    this.branchList,
  });

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    name = json['name'];
    npp = json['npp'];
    phone = json['phone'];
    branchId = json['branch_id'];
    branchCode = json['branch_code'];
    branchName = json['branch_name'];
    roleId = json['role_id'];
    roleHris = json['role_hris'];
    image = json['image'];
    if (json['branch_list'] != null) {
      branchList = <Branch>[];
      json['branch_list'].forEach((v) {
        branchList!.add(Branch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['username'] = username;
    data['name'] = name;
    data['npp'] = npp;
    data['phone'] = phone;
    data['branch_id'] = branchId;
    data['branch_code'] = branchCode;
    data['branch_name'] = branchName;
    data['role_id'] = roleId;
    data['role_hris'] = roleHris;
    data['image'] = image;
    if (branchList != null) {
      data['branch_list'] = branchList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
