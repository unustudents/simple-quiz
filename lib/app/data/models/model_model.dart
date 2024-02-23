class Model {
  UserModel? userModel;
  CreateQuiz? createQuiz;
  AddQuiz? addQuiz;

  Model({this.userModel, this.createQuiz, this.addQuiz});

  Model.fromJson(Map<String, dynamic> json) {
    userModel = json['user_model'] != null
        ? UserModel?.fromJson(json['user_model'])
        : null;
    createQuiz = json['create_quiz'] != null
        ? CreateQuiz?.fromJson(json['create_quiz'])
        : null;
    addQuiz =
        json['add_quiz'] != null ? AddQuiz?.fromJson(json['add_quiz']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userModel != null) {
      data['user_model'] = userModel?.toJson();
    }
    if (createQuiz != null) {
      data['create_quiz'] = createQuiz?.toJson();
    }
    if (addQuiz != null) {
      data['add_quiz'] = addQuiz?.toJson();
    }
    return data;
  }
}

class UserModel {
  String? name;
  String? email;

  UserModel({this.name, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class CreateQuiz {
  String? title;
  String? description;
  String? category;

  CreateQuiz({this.title, this.description, this.category});

  CreateQuiz.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    return data;
  }
}

class AddQuiz {
  String? question;
  String? optionTrue;
  String? option2;
  String? option3;
  String? option4;

  AddQuiz(
      {this.question,
      this.optionTrue,
      this.option2,
      this.option3,
      this.option4});

  AddQuiz.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    optionTrue = json['option_true'];
    option2 = json['option_2'];
    option3 = json['option_3'];
    option4 = json['option_4'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['question'] = question;
    data['option_true'] = optionTrue;
    data['option_2'] = option2;
    data['option_3'] = option3;
    data['option_4'] = option4;
    return data;
  }
}
