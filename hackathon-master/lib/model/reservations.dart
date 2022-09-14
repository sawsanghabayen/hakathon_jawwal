class Reservations {
  late int id;
  late String name;
  late String date;
  late String status;
  late String address;
  late String userId;
  late String productId;

  static const tableName='reservations';

  Reservations();
  Reservations.fromMap(Map<String,dynamic> rowMap){
    id=rowMap['id'];
    name=rowMap['name'];
    date=rowMap['date'];
    status=rowMap['status'];
    address=rowMap['address'];
    userId=rowMap['userId'];
    productId=rowMap['productId'];

  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic>map=<String,dynamic>{};
    map['name']=name;
    map['date']=date;
    map['status']=status;
    map['address']=address;
    map['userId']=userId;
    map['productId']=productId;
    return map;
  }

}