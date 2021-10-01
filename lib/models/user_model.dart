class UserModel {
  late String name;
  late String uId;
  late String email;
  late String password;
  late String phone;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.uId,
  });
  UserModel.fromJson(Map<String,dynamic>json)
  {
    name =json['name'];
    uId =json['uId'];
    email =json['email'];
    password =json['password'];
    phone =json['phone'];
  }

  Map<String,dynamic> toJson(){
    return{
      'name':name,
      'uId':uId,
      'email':email,
      'password':password,
      'phone':phone,
    };
  }
}
