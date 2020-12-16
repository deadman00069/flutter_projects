class CustomerDetail {
  String fName;
  String lName;
  String eMail;

  CustomerDetail({this.fName,this.lName,this.eMail});

  Map<String,String> addData()=>{
    'fName': fName,
    'lName' : lName,
    'eMail' : eMail
  };
}