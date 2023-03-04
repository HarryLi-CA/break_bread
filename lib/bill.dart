class Bill {

  Bill({required this.restaurant, required this.cost, required this.dueDate, required this.emails});
  String restaurant;
  String dueDate;
  int cost;
  List<String> emails;
  Bill.fromJson(Map<String, Object?> json):this(
    restaurant: (json['restaurant']! as String),
    cost: (json['cost']! as int),
    dueDate: (json['dueDate']! as String),
    emails: (json['emails']! as List).cast<String>(),
  );
  Map<String, Object?> toJson(){
    return{
      "restaurant": restaurant,
      "cost": cost,
      "dueDate": dueDate,
      "emails": emails,
    };
  }
  Bill.empty():this(
    restaurant: "",
    cost: 0,
    dueDate: "",
    emails: List.empty(),
  );
}