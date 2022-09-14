class UserModle {
  var email;
  var phone;
  var password;
  var imageUrl;
  var fullName;
  var isMeal;
  var uId;
  UserModle();

  // UserModle({
  //   required this.email,
  //   required this.phone,
  //   required this.password,
  //   required this.imageUrl,
  //   required this.isMeal,
  //   required this.uId,
  // });

 static Map<String, dynamic> toMap(UserModle user) {
    Map<String, dynamic> map = Map();
    map["email"] = user.email;
    map["phone"] = user.phone;
    map["password"] = user.password;
    map["fullName"] = user.fullName;
    map["imageUrl"] = user.imageUrl;
    map["isMeal"] = user.isMeal;
    map["uId"] = user.uId;
    return map;
  }

  UserModle.fromJson  (Map<String, dynamic> map){

    this.email= map["email"] ;
    this.phone= map["phone"] ;
    this.password= map["password"];
    this.imageUrl= map["imageUrl"];
    this.fullName= map["fullName"];
    this.isMeal= map["isMeal"] ;
    this.uId=   map["uId"] ;

  }


}