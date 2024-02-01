class UserModel {
  String email;
  String password;
  String name;

  UserModel({required this.name, required this.password, required this.email});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
        name: data['name'],
        password: data['description'],
        email: data['email']);
  }

  Map<String, String> toMap() {
    return {'name': name, 'description': password, 'email': email};
  }
}
