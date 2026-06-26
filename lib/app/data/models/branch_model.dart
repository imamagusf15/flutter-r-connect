import 'package:flutter_rconnect/app/data/models/role_model.dart';

class Branch {
  int? isDefault;
  int? isActive;
  String? branchId;
  String? branchCode;
  String? branchName;
  List<Role>? roleList;

  Branch({
    this.isDefault,
    this.isActive,
    this.branchId,
    this.branchCode,
    this.branchName,
    this.roleList,
  });

  Branch.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    isActive = json['is_active'];
    branchId = json['branch_id'];
    branchCode = json['branch_code'];
    branchName = json['branch_name'];
    if (json['role_list'] != null) {
      roleList = <Role>[];
      json['role_list'].forEach((v) {
        roleList!.add(Role.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['is_default'] = isDefault;
    data['is_active'] = isActive;
    data['branch_id'] = branchId;
    data['branch_code'] = branchCode;
    data['branch_name'] = branchName;
    if (roleList != null) {
      data['role_list'] = roleList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
