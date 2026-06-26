class Role {
  int? isDefault;
  int? isActive;
  int? roleId;
  String? roleHris;

  Role({this.isDefault, this.isActive, this.roleId, this.roleHris});

  Role.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    isActive = json['is_active'];
    roleId = json['role_id'];
    roleHris = json['role_hris'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['is_default'] = isDefault;
    data['is_active'] = isActive;
    data['role_id'] = roleId;
    data['role_hris'] = roleHris;
    return data;
  }
}
