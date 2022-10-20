class UserModel {
  String? userId;
  String? userRoleId;
  String? userType;
  String? companyId;
  String? firstName;
  String? lastName;
  String? firstGivenName;
  String? secondGivenName;
  String? familyName;
  String? thirdGivenName;
  String? fourthGivenName;
  String? givenNameArabic;
  String? fatherNameArabic;
  String? grandfatherNameArabic;
  String? greatfatherNameArabic;
  String? preferredFamilyName;
  String? preferredGivenName;
  String? email;
  String? username;
  String? password;
  String? companyName;
  String? tradingName;
  String? registrationNo;
  String? governmentTax;
  String? companyTypeId;
  String? profilePhoto;
  String? contactNumber;
  String? gender;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? zipcode;
  String? country;
  String? contactPerson;
  String? contactPersonPhone;
  String? website;
  String? crTaxCard;
  String? bankAccount;
  String? bankAccountWithSeal;
  String? bankCertificate;
  String? lastLoginDate;
  String? lastLogoutDate;
  String? lastLoginIp;
  String? isLoggedIn;
  String? isActive;
  String? empFormStep;
  String? createdAt;

  UserModel(
      {this.userId,
        this.userRoleId,
        this.userType,
        this.companyId,
        this.firstName,
        this.lastName,
        this.firstGivenName,
        this.secondGivenName,
        this.familyName,
        this.thirdGivenName,
        this.fourthGivenName,
        this.givenNameArabic,
        this.fatherNameArabic,
        this.grandfatherNameArabic,
        this.greatfatherNameArabic,
        this.preferredFamilyName,
        this.preferredGivenName,
        this.email,
        this.username,
        this.password,
        this.companyName,
        this.tradingName,
        this.registrationNo,
        this.governmentTax,
        this.companyTypeId,
        this.profilePhoto,
        this.contactNumber,
        this.gender,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.zipcode,
        this.country,
        this.contactPerson,
        this.contactPersonPhone,
        this.website,
        this.crTaxCard,
        this.bankAccount,
        this.bankAccountWithSeal,
        this.bankCertificate,
        this.lastLoginDate,
        this.lastLogoutDate,
        this.lastLoginIp,
        this.isLoggedIn,
        this.isActive,
        this.empFormStep,
        this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userRoleId = json['user_role_id'];
    userType = json['user_type'];
    companyId = json['company_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    firstGivenName = json['first_given_name'];
    secondGivenName = json['second_given_name'];
    familyName = json['family_name'];
    thirdGivenName = json['third_given_name'];
    fourthGivenName = json['fourth_given_name'];
    givenNameArabic = json['given_name_arabic'];
    fatherNameArabic = json['father_name_arabic'];
    grandfatherNameArabic = json['grandfather_name_arabic'];
    greatfatherNameArabic = json['greatfather_name_arabic'];
    preferredFamilyName = json['preferred_family_name'];
    preferredGivenName = json['preferred_given_name'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    companyName = json['company_name'];
    tradingName = json['trading_name'];
    registrationNo = json['registration_no'];
    governmentTax = json['government_tax'];
    companyTypeId = json['company_type_id'];
    profilePhoto = json['profile_photo'];
    contactNumber = json['contact_number'];
    gender = json['gender'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    country = json['country'];
    contactPerson = json['contact_person'];
    contactPersonPhone = json['contact_person_phone'];
    website = json['website'];
    crTaxCard = json['cr_tax_card'];
    bankAccount = json['bank_account'];
    bankAccountWithSeal = json['bank_account_with_seal'];
    bankCertificate = json['bank_certificate'];
    lastLoginDate = json['last_login_date'];
    lastLogoutDate = json['last_logout_date'];
    lastLoginIp = json['last_login_ip'];
    isLoggedIn = json['is_logged_in'];
    isActive = json['is_active'];
    empFormStep = json['emp_form_step'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_role_id'] = this.userRoleId;
    data['user_type'] = this.userType;
    data['company_id'] = this.companyId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['first_given_name'] = this.firstGivenName;
    data['second_given_name'] = this.secondGivenName;
    data['family_name'] = this.familyName;
    data['third_given_name'] = this.thirdGivenName;
    data['fourth_given_name'] = this.fourthGivenName;
    data['given_name_arabic'] = this.givenNameArabic;
    data['father_name_arabic'] = this.fatherNameArabic;
    data['grandfather_name_arabic'] = this.grandfatherNameArabic;
    data['greatfather_name_arabic'] = this.greatfatherNameArabic;
    data['preferred_family_name'] = this.preferredFamilyName;
    data['preferred_given_name'] = this.preferredGivenName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['company_name'] = this.companyName;
    data['trading_name'] = this.tradingName;
    data['registration_no'] = this.registrationNo;
    data['government_tax'] = this.governmentTax;
    data['company_type_id'] = this.companyTypeId;
    data['profile_photo'] = this.profilePhoto;
    data['contact_number'] = this.contactNumber;
    data['gender'] = this.gender;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['country'] = this.country;
    data['contact_person'] = this.contactPerson;
    data['contact_person_phone'] = this.contactPersonPhone;
    data['website'] = this.website;
    data['cr_tax_card'] = this.crTaxCard;
    data['bank_account'] = this.bankAccount;
    data['bank_account_with_seal'] = this.bankAccountWithSeal;
    data['bank_certificate'] = this.bankCertificate;
    data['last_login_date'] = this.lastLoginDate;
    data['last_logout_date'] = this.lastLogoutDate;
    data['last_login_ip'] = this.lastLoginIp;
    data['is_logged_in'] = this.isLoggedIn;
    data['is_active'] = this.isActive;
    data['emp_form_step'] = this.empFormStep;
    data['created_at'] = this.createdAt;
    return data;
  }
}
