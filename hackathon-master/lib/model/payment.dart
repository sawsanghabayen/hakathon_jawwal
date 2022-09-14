class Payment {
  int? id;
  String? type;
  String? holderName;
  String? cardNumber;
  String? expDate;
  String? cvv;
  String? userId;

  Payment(
      {this.id,
        this.type,
        this.holderName,
        this.cardNumber,
        this.expDate,
        this.cvv,
        this.userId,
     });

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    holderName = json['holder_name'];
    cardNumber = json['card_number'];
    expDate = json['exp_date'];
    cvv = json['cvv'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['holder_name'] = this.holderName;
    data['card_number'] = this.cardNumber;
    data['exp_date'] = this.expDate;
    data['cvv'] = this.cvv;
    data['user_id'] = this.userId;
    return data;
  }
}