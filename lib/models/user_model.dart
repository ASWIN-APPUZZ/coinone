 
class User {
  String? username;
  String? password;
  String? firstName;
  String? lastName;
  String? email;

  User({
        this.username,
        this.password,
        this.firstName,
        this.lastName,
        this.email
        });

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    return data;
  }

  static List<User> listFromJson(List<dynamic> list) {
    List<User> rows = list.map((i) => User.fromJson(i)).toList();
    return rows;
  }
}