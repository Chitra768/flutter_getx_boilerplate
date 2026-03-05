class UserModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? token;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['user']?['name'],
      email: json['user']?['email'],
      phone: json['user']?['phone'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': {
        'name': name,
        'email': email,
        'phone': phone,
      },
      'token': token,
    };
  }
}
