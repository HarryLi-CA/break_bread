class UserData {
  String email;
  String name;
  String profilePicURL;
  List<String> billsID= List.empty();

  UserData({
    required this.email,
    required this.name,
    required this.profilePicURL,
});
  UserData.fromJson(Map<String, Object?> json):this(
    email: (json['email']! as String),
    name: (json['name']! as String),
    profilePicURL: (json['profilePicURL']! as String),
  );
  Map<String, Object?> toJson(){
    return{
      "email": email,
      "name": name,
      "profilePicURL": profilePicURL,
      "billsID": billsID,
    };
  }
}
