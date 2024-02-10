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

class CreateQuiz {
  String title;
  String? description;
  String category;

  CreateQuiz({required this.title, this.description, required this.category});

  factory CreateQuiz.fromMap(Map<String, dynamic> data) {
    return CreateQuiz(
        title: data['title'],
        description: data['description'],
        category: data['category']);
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description, 'category': category};
  }
}

class AddQuistion {
  String question;
  String optionTrue;
  String option2;
  String option3;
  String option4;
  AddQuistion({
    required this.question,
    required this.optionTrue,
    required this.option2,
    required this.option3,
    required this.option4,
  });

  factory AddQuistion.fromMap(Map<String, dynamic> data) {
    return AddQuistion(
        question: data['question'],
        optionTrue: data['option_true'],
        option2: data['option_2'],
        option3: data['option_3'],
        option4: data['option_4']);
  }
  Map<String, String> toMap() {
    return {
      'question': question,
      'option_true': optionTrue,
      'option_2': option2,
      'option_3': option3,
      'option_4': option4
    };
  }
}
