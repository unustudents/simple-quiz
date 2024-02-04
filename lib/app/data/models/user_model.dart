class UserModel {
  String email;
  String name;

  UserModel({required this.name, required this.email});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(name: data['name'], email: data['email']);
  }

  Map<String, String> toMap() {
    return {'name': name, 'email': email};
  }
}
