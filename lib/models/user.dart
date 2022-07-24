class UserData {
  late String id;
  late String name;
 // late String email;
  late String phone;
  late String city;
UserData();
  UserData.fromMap(Map<String, dynamic> documentMap) {
    
    name = documentMap['name'];
   // email = documentMap['email'];
    phone = documentMap['phone'];
    city = documentMap['city'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
   
    map['name'] = name;
   // map['email'] = email;
    map['name'] = name;
    map['phone'] = phone;
    map['city'] = city;
    return map;
  }
}
