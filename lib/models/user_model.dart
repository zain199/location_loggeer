class UserModel {
  String? userId;
  String? email;
  String? userType;
  String? companyName;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? contactNumber;
  String? gender;
  String? designation;

  UserModel(
      {this.userId,
        this.email,
        this.userType,
        this.companyName,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.contactNumber,
        this.gender,
        this.designation});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    userType = json['user_type'];
    companyName = json['company_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
    contactNumber = json['contact_number'];
    gender = json['gender'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['user_type'] = this.userType;
    data['company_name'] = this.companyName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['contact_number'] = this.contactNumber;
    data['gender'] = this.gender;
    data['designation'] = this.designation;
    return data;
  }
}
