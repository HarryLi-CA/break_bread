class UserData {
  String email;
  String name;
  String profilePicURL;
  List<String> billsID;

  UserData({
    required this.email,
    required this.name,
    required this.profilePicURL,
    required this.billsID,
});
  UserData.fromJson(Map<String, Object?> json):this(
    email: (json['email']! as String),
    name: (json['name']! as String),
    profilePicURL: (json['profilePicURL']! as String),
    billsID: (json['billsID']! as List).cast<String>(),
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
