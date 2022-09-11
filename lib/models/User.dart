enum Gender{
male,
female

}



class UserMdoel {


  String get gen{
if(gender==Gender.female){
return "female";
}else{
return 'male';
}


  }
 
  String? id;
  String? name;//
  String? email;//
  DateTime? birth;
 String? password;//
  int? phoneNumber;//
  String? gender;

UserMdoel({required this.password,required this.birth,required this.email,required this.gender,  this.id,
required this.name,required this.phoneNumber});
  
}