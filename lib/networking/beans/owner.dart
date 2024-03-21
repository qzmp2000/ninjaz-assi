

class Owner{
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  Owner(this.id, this.title, this.firstName, this.lastName, this.picture);

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }
}